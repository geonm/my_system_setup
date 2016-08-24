w, dl_dw = model:getParameters() --w는 weights, dl_dw는 gradient parameter가 된다.

~ward(input, output)
model:backward(input,do_dw) -- 이를 수행했을 경우, dl_dw가 자동으로 업데이트 된다. 업데이트 전 dl_dw:zero() 필수
