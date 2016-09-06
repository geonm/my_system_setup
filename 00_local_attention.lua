require 'nn'
require 'nngraph'

local attention = {}
function attention.local_atten(input_size_ques, embedding_size)
  local inputs ={}
  local outputs ={}
  --local Q_box = {}
  table.insert(inputs,nn.Identity()())
  table.insert(inputs,nn.Identity()())
  local que_feat = inputs[1]
  local img_feat = inputs[2]
  --w = 14, h = 14, d = 512
  local w = 14
  local h = 14
  local d = 512
  --------------------------
  --image feature embedding
  local trans_model = nn.Transpose({1,2})
  ----
  local Q_box_img = nn.ParallelTable()
  
  for i = 1, w*h do
    Q_box_img:add(nn.Linear(d,embedding_size))
  end
  --image feature dimension precess
  --local img_feat_before_emb = ((nn.View(-1):setNumInputDims(2)(img_feat)))
  --local trans_img_feat_before_emb = trans_model(img_feat_before_emb)
  
  local Q_box_img_out = Q_box_img(img_feat)--Q_box_img(trans_img_feat_before_emb) --Q_box + img
  
  local Q_box_que = nn.ParallelTable()
  
  for i = 1, w*h do
    Q_box_que:add(nn.Linear(input_size_ques,embedding_size))
  end
  
  --que_feat
  --make w*h question values
  --local que_Rep = nn.Replicate(w*h):forward(que_feat)
  --que_Rep
  -- [{{que_feat},{que_feat},...,{que_feat}}]
  --Dimension = (w*h, input_size_ques)
  --local Q_box_que_out = Q_box_que(que_Rep)
  ------------------------------------------
  -- not using Replicate...
  local Q_box_que_out = Q_box_que(que_feat)
  --for i = 1, w*h do
  --  local tmp_out = Q_box_que:get(i)(que_feat)
  --  table.insert(Q_box_que_out,tmp_out)
  --end
  
  ------------------------------------------
  --request Q to IMG
  --just add them all!
  local Q_box_img_Tensor--= torch.Tensor(w*h,embedding_size):zero()
  local Q_box_que_Tensor--= torch.Tensor(w*h,embedding_size):zero()
  
  --local copy_model = nn.Copy()
  --for i = 1, w*h do
  --  Q_box_img_Tensor[i] = copy_model(Q_box_img_out[i])
  --  Q_box_que_Tensor[i] = copy_model(Q_box_que_out[i])
  --end
  -----------------------------------
  --for i, k in pairs(Q_box_img_out) do
  --  Q_box_img_Tensor[i] = k
  --end
  --for i, k in pairs(Q_box_que_out) do
  --  Q_box_que_Tensor[i] = k
  --end
  -----------------------------------
  local join_model = nn.JoinTable(1)
  local reshape_model = nn.Reshape(w*h,embedding_size)
  Q_box_img_Tensor = reshape_model(join_model(Q_box_img_out))
  Q_box_que_Tensor = reshape_model(join_model(Q_box_que_out))
  -----------------------------------
  
  local QtoIMG = nn.CAddTable()({Q_box_img_Tensor,Q_box_que_Tensor})
  --to make cubic!
  local QtoIMG_trans = trans_model(QtoIMG)
  local QtoIMG_cubic = nn.Reshape(embedding_size,w,h)(QtoIMG_trans)
  local Atten_map = nn.SpatialConvolution(embedding_size,1,1,1)(QtoIMG_cubic) --단 10개의 weight만으로 reduction 시키기
  
  table.insert(outputs,Atten_map)
  
  return nn.gModule(inputs, outputs)
end


function attention.feature_prep(input_size_ques, embedding_size)
  
  local inputs = {}
  local outputs = {}
  table.insert(inputs,nn.Identity()())
  table.insert(inputs,nn.Identity()())
  local que_feat = inputs[1]
  local img_feat = inputs[2]
  local w = 14
  local h = 14
  local d = 512 --same with embedding_size
  
  local trans_model = nn.Transpose({1,2})
  local rep_model = nn.Replicate(w*h)
  
  local img_feat2 = nn.View(-1):setNumInputDims(2)(img_feat)
  local img_feat3 = trans_model(img_feat2)
  
  local que_feat2 = rep_model(que_feat)
  
  table.insert(outputs,que_feat2)
  table.insert(outputs,img_feat3)
  
  return nn.gModule(inputs, outputs)  
end

return attention

  