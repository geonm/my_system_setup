for i = 1, 10 do
  print(i)
end

require 'nn'



tmp = nn.ParallelTable()

for i = 1,14*14 do
  tmp:add(nn.Linear(512,3))
  --tmp:get(i).weight:fill(1)
  --tmp:get(i).bias:fill(0)
end

--print(tmp)

--tmp_input = torch.rand(512,2,2)
--tmp_input = nn.View(-1,512)(tmp_input)
--print(tmp_input)

--tmptmp = torch.Tensor({{{1,2,3},{4,5,6}},{{7,8,9},{10,11,12}}})
tmptmp = torch.rand(512,14,14)
tmp2 = tmptmp
print("--------------------------------")
--print(tmptmp)
print("--------------------------------")
--print((#tmptmp)[1]*(#tmptmp)[2]*(#tmptmp)[3])
--tmptmp=nn.View(1,(#tmptmp)[1]*(#tmptmp)[2]*(#tmptmp)[3])((nn.View(-1):setNumInputDims(2)(tmptmp)):transpose(1,2))
tmptmp = ((nn.View(-1):setNumInputDims(2)(tmptmp)):transpose(1,2))
--tmptmp = nn.View(1,12)
print(tmp2[1][1][1],tmp2[2][1][1])
print(tmptmp[1][1],tmptmp[1][2])

local input = {}
for i=1, (#tmptmp)[1] do
  table.insert(input,tmptmp[i])
end

output = tmp(input)


print(#tmptmp)


for i = 1,3 do
  print(input[i][1],"+",input[i][2],"=",output[i])
end

print("--------------------------------")

print(output)
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")




print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
print("print x:")
x = torch.Tensor({1,2,3})
print(x)
print("--------------------------------")
tmp = nn.Replicate(10)
print(tmp(x))
--print(nn.Reshape(10,3)(tmp(x)))
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
tmp_input = torch.Tensor({1,2,3})
tmp = nn.CAddTable()
print(output)
tmp2 = tmp({output[1],output[1]})
print(tmp2)
--print(tmptmp)
--output -> Tensor
local output_Tensor = torch.Tensor(14*14,3):zero()

for i = 1, 14*14 do
  output_Tensor[i] = output[i]
end

print(output_Tensor)
print(output_Tensor[1])
print(output[1])

print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
tmptmp = torch.Tensor({{{1,2,3},{4,5,6}},{{7,8,9},{10,11,12}}})
print(tmptmp)
tmptmp2 = torch.Tensor({{1,2,3,4,5,6},{7,8,9,10,11,12}})
tmptmp3 = tmptmp2:transpose(1,2)
print(tmptmp2)
print(nn.Reshape(6,1,2)(tmptmp3))
print(tmptmp2)
mode = nn.SpatialConvolution(10,1,1,1)
print(mode.weight)

print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
print(tmptmp)
print("--------------------------------")
print(nn.Reshape(-1)(tmptmp))
print("--------------------------------")
model = nn.Transpose({1,2})
tt = nn.Reshape(-1)(tmptmp)
ttt = model(tt)
print(tt)
print(ttt)

print("--------------------------------")
print("--------------------------------")
print("--------------------------------")

model = nn.Copy()


local output_Tensor = torch.Tensor(14*14,3):zero()

for i = 1, 14*14 do
  output_Tensor[i] = model(output[i])
end

print(output_Tensor)
print(output_Tensor[1])
print(output[1])

print("--------------------------------")
print("--------------------------------")
print("--------------------------------")

model = nn.JoinTable(1)
model_Reshape = nn.Reshape(196,3)
print(model(output))
print(model_Reshape(model(output)))
--print(model(output)
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
require 'nngraph'

function toy_model()
  input_node = nn.Identity()()

  P_model = nn.ParallelTable()
  for i = 1, 5 do
    P_model:add(nn.Linear(5,3))
  end

  --print(P_model)
  output_P = P_model(input_node)
  
  join_model = nn.JoinTable(1)
  
  reshape_model = nn.Reshape(3,1,5)

  output_JR = reshape_model(join_model(output_P))

  output_S = nn.SpatialConvolution(3,1,1,1)(output_JR)

  return nn.gModule({input_node},{output_S})
end

function toy_model2()
  input_node = nn.Identity()()
  
  hidden1 = nn.Linear(10,5)(input_node)
  
  hidden2 = nn.Linear(5,10)(hidden1)
  
  return nn.gModule({input_node},{hidden2})
end




model = toy_model()

input = torch.rand(5,5)

output = model:forward(input)

model:backward(input,output)

print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")
print("--------------------------------")

--Dimension change

input = torch.Tensor({{{1,2,3},{4,5,6}},{{7,8,9},{10,11,12}}})
print(input)
--output = nn.View(-1):forward(input)
output = torch.Tensor(6,2):zero()
local k = 1
for i = 1, 2 do
  for j = 1, 3 do
    output[k] = input[{{},i,j}]
    k = k + 1
  end
end
--print(output)

input2 = nn.Copy():forward((nn.Reshape(2,6):forward(input)))

input3 = nn.Transpose({1,2}):forward(input2)
print(input3)
print("--------------------------------")


function local_atten(input_size_ques, embedding_size)
  local inputs ={}
  local outputs ={}
  table.insert(inputs,nn.Identity()())
  table.insert(inputs,nn.Identity()())
  local que_feat = inputs[1]
  local img_feat = inputs[2]
  local w = 14
  local h = 14
  local d = 512
  --------------------------
  local trans_model = nn.Transpose({1,2})
  ----
  local Q_box_img = nn.ParallelTable()
  
  for i = 1, w*h do
    Q_box_img:add(nn.Linear(d,embedding_size))
  end
  
  --local img_feat_before_emb = ((nn.Reshape(14*14,512)(img_feat)))
  
  
  local trans_img_feat_before_emb = Q_box_img(img_feat)
  
  
  
  
  -------------------------
 
  -------------------------
  
  local Q_box_img_out = trans_img_feat_before_emb --Q_box + img
  
  local Q_box_que = nn.ParallelTable()
  
  for i = 1, w*h do
    Q_box_que:add(nn.Linear(input_size_ques,embedding_size))
  end
  
  ------------------------------------------

  local Q_box_que_out = Q_box_que(que_feat)

  ------------------------------------------

  local Q_box_img_Tensor = torch.Tensor(w*h,embedding_size):zero()
  local Q_box_que_Tensor = torch.Tensor(w*h,embedding_size):zero()
  
  -----------------------------------
  local join_model = nn.JoinTable(1)
  local reshape_model = nn.Reshape(w*h,embedding_size)
  Q_box_img_Tensor = reshape_model(join_model(Q_box_img_out))
  Q_box_que_Tensor = reshape_model(join_model(Q_box_que_out))
  -----------------------------------
  
  local QtoIMG = nn.CAddTable()({Q_box_img_Tensor,Q_box_que_Tensor})
  
  local QtoIMG_trans = trans_model(QtoIMG)
  local QtoIMG_cubic = nn.Reshape(embedding_size,w,h)(QtoIMG_trans)
  local Atten_map = nn.SpatialConvolution(embedding_size,1,1,1)(QtoIMG_cubic)
  --local Atten_map = nn.SpatialConvolution(embedding_size,1,1,1)(Q_box_img_Tensor)
  table.insert(outputs,Atten_map)
  --print(#Q_box_img_Tensor)
  return nn.gModule(inputs, outputs)
  --return nn.gModule({que_feat}, {Q_box_que_Tensor})
end


model = local_atten(512,512)

input_img = torch.rand(512,14,14)
input_que = torch.rand(14*14,512)

---------------------------------------------
local input_img2 = ((nn.View(-1):setNumInputDims(2):forward(input_img)))
local input_img3 = nn.Transpose({1,2}):forward(input_img2)
  

---------------------------------------------
--input_img3 = nn.Transpose({1,2}):forward(input_img2)
--print(input_img2)
--print(input_img3)
output = model:forward({input_que,input_img3})
print(output)
model:backward({input_que,input_img3},output)