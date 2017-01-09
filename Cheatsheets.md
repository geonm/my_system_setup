w, dl_dw = model:getParameters() --w는 weights, dl_dw는 gradient parameter가 된다.

~ward(input, output)
model:backward(input,do_dw) -- 이를 수행했을 경우, dl_dw가 자동으로 업데이트 된다. 업데이트 전 dl_dw:zero() 필수

-------
-- torch debug IDE install
1. go to https://github.com/soumith/zbs-torch
2. follow the install guide
3. add torch7 env like this,
   1. sudo vim ~/.bashrc
   2.  export CUDA_HOME=/usr/local/cuda-8.0
   
       export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
       
       export TORCH_BIN=/root/torch
   3. source ~/.bashrc

-- torch debug IDE RUN

0. open terminal
1. sudo su
2. cd zbs-torch
3. ./zbstudio.sh

--To see gpu_meter in UBUNTU 16.04

0. open terminal
1. watch nvidia-smi

--To see Mem_meter in UBUNTU 16.04

0. open terminal
1. watch watch -n 1 free -m

--To install cudnn in UBUNTU 16.04

open terminal at Download folder

$ sudo cp cuda/include/*.h /usr/local/cuda/include

$ sudo cp cuda/lib64/* /usr/local/cuda/lib64

--To install anaconda

wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh

bash Anaconda-2.3.0-Linux-x86_64.sh

conda create --name tf_env --clone root

--To install Keras

https://github.com/fchollet/keras


--To install NLTK based on Python

1. activate your conda enviroment variable.

2. pip install -U nltk

3. start python
   import nltk
   nltk.download()

-- To erase cache memory in ubuntu

$ echo 3 | sudo tee /proc/sys/vm/drop_caches

-- To install opencv based on Python at UBUNTU 16.04

1. First, follow this instruction : https://gist.github.com/arthurbeggs/06df46af94af7f261513934e56103b30

2. Add env, $ export PYTHONPATH=/usr/local/python/2.7:$PYTHONPATH

3. If you are using conda env_var, copy cv2.so from "/usr/local/python/2.7" to 
   "/home/yourname/anaconda2/envs/tf_env/lib/python2.7/site-packages"
