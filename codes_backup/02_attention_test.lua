require 'nn'
require 'nngraph'
local attention = require '00_local_attention'

input_size_ques = 512
embedding_size = 512

model = attention.local_atten(input_size_ques,embedding_size)

feature_prep = attention.feature_prep(input_size_ques, embedding_size)

for i =1, 12 do
  print(model:get(i))
end

local d = 512; w = 14; h = 14;
input_img = torch.rand(d, w, h)
input_que = torch.rand(input_size_ques)
--rep_model = nn.Replicate(w*h)
--input_que_box = rep_model:forward(input_que)
--local input_img2 = ((nn.View(-1):setNumInputDims(2):forward(input_img)))
--local input_img3 = nn.Transpose({1,2}):forward(input_img2)

prp_output = feature_prep:forward({input_que,input_img})
input_que_box = prp_output[1]
input_img3 = prp_output[2]
output = model:updateOutput({input_que_box,input_img3})
print(#output)
--pram, grad_params = model:parameters()
--print(pram)
--print(grad_params)
--model:updateGradInput({input_que_box,input_img},torch.rand(1,14,14))
--print(back)
--print(model:get(1))
