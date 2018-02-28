CUDA_VISIBLE_DEVICES=0,1,2,3,4,5 python your_code_name.py

------------------------------------------------------------------
-- Thinkpad with ubuntu 16.04 setting list
1. To set threshold values for charging battery: https://www.quora.com/My-laptop-battery-is-not-charging-after-60
2. https://www.reddit.com/r/thinkpad/comments/6o0cjg/my_t470s_arrived/
3. http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html
4. printer. add network device (10.64.91.xxx), then manually set-up Generic-PCL-6-PCL-XL-LF
5. Shut-down auto-browsing printer: sudo systemctl stop cups-browsed, sudo systemctl disable cups-browsed
6. install cmake, protobuf from source: http://radiation.tistory.com/entry/Ubuntu%EC%97%90-cmake-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0, https://github.com/google/protobuf/blob/master/src/README.md
7. You should install some files before you try to install chrome@ubuntu: $ sudo apt-get install libappindicator1
8. then DO NOT TRUST ANACONDA PACKAGE!!! JUST install everything from source
9. Install Opencv3.x from source : http://webnautes.tistory.com/1030
10. then $ pip3 install tensorflow (CPU mode)
11. $ sudo find / name -name libgomp.so.1
12. Korean setup : http://promobile.tistory.com/363, then https://forum.ubuntu-kr.org/viewtopic.php?t=27322
13. How to ignore closing lid: IgnoreLid=true in /etc/UPower/UPower.conf
---------------------------------------
## Thinkpad t470s with ubuntu 16.04 setting list
1. To set threshold values for chargning battery: https://www.reddit.com/r/thinkpad/comments/6o0cjg/my_t470s_arrived/
1-1. before installing chrome, do $ sudo apt-get install libappindicator1
1-2. $ sudo dpkg -l chrome***.deb
2. first, install opencv3.x from source : http://webnautes.tistory.com/1030 and https://www.learnopencv.com/install-opencv3-on-ubuntu/
3. second, install cmake and protobuf from source : http://radiation.tistory.com/entry/Ubuntu%EC%97%90-cmake-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0, https://github.com/google/protobuf/blob/master/src/README.md
4, third, $ pip3 install tensorflow, $ pip3 install dlib
5. follow above setup for printer
6. $ git clone https://github.com/tensorflow/models.git
---------------------------------------
-- Windows 10 setting
1. Install anaconda3 (
https://repo.continuum.io/archive/Anaconda3-4.2.0-Windows-x86_64.exe)
2. Opencv3 (https://github.com/conda/conda/issues/3652)
3. Pycharm (https://www.jetbrains.com/pycharm/download/#section=windows)

-----------------------------------------------------------------
-- torch debug IDE install
1. go to https://github.com/soumith/zbs-torch
2. follow the install guide
3. add torch7 env like this,
   1. sudo vim ~/.bashrc
   2.  export CUDA_HOME=/usr/local/cuda-8.0
   
       export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
       
       export TORCH_BIN=/root/torch
   3. source ~/.bashrc

-----------------------------------------------------------------
-- server setting

1. Install anaconda
2. vim ~/.bashrc
3. add this line
   export LD_LIBRARY_PATH=/usr/local/cuda/lib64/
4. source ~/.bashrc
5. pip install --upgrade pip
6. pip install tensorflow-gpu
7. Good luck :)


-----------------------------------------------------------------
-- torch debug IDE RUN

0. open terminal
1. sudo su
2. cd zbs-torch
3. ./zbstudio.sh

-----------------------------------------------------------------
--To see gpu_meter in UBUNTU 16.04

0. open terminal
1. watch nvidia-smi

--To see Mem_meter in UBUNTU 16.04

0. open terminal
1. watch watch -n 1 free -m

-----------------------------------------------------------------
--To install cudnn in UBUNTU 16.04

open terminal at Download folder @ https://developer.nvidia.com/rdp/cudnn-download

$ sudo cp cuda/include/*.h /usr/local/cuda/include

$ sudo cp cuda/lib64/* /usr/local/cuda/lib64

-----------------------------------------------------------------
--To install anaconda

wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh

bash Anaconda-2.3.0-Linux-x86_64.sh

conda create --name tf_env --clone root

-----------------------------------------------------------------
--To install Keras

https://github.com/fchollet/keras


-----------------------------------------------------------------
--To install NLTK based on Python

1. activate your conda enviroment variable.

2. pip install -U nltk

3. start python
   import nltk
   nltk.download()

-----------------------------------------------------------------
-- To erase cache memory in ubuntu

$ echo 3 | sudo tee /proc/sys/vm/drop_caches

-----------------------------------------------------------------
-- To install opencv based on Python at UBUNTU 16.04

0. *** easiest way to install opencv2. Turn on your env_id and type $ conda install -c menpo opencv=2.4.11

1. First, follow this instruction : https://gist.github.com/arthurbeggs/06df46af94af7f261513934e56103b30

2. Add env, $ export PYTHONPATH=/usr/local/python/2.7:$PYTHONPATH

3. If you are using conda env_var, copy cv2.so from "/usr/local/python/2.7" to 
   "/home/yourname/anaconda2/envs/tf_env/lib/python2.7/site-packages"

-----------------------------------------------------------------
-- To install DLIB

0. SUPER EASY WAY :
   conda install -c menpo dlib=18.18
   
   If it works well, you don't have to follow following instructions
   
   (https://anaconda.org/menpo/dlib)

1. sudo apt-get install cmake

2. sudo apt-get install libboost-all-dev

3. Download dlib from http://dlib.net/

3. sudo apt-get install python-setuptools

4. sudo python setup.py install 
-----------------------------------------------------------------

-- Install Tensorflow from source :)

0. I will assume you already installed cuda 8.0, cudnn 5.

1. You should install Bazel first
   - sudo add-apt-repository ppa:webupd8team/java
   - sudo apt-get update
   - sudo apt-get install oracle-java8-installer
   - echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
   - curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
   - sudo apt-get update && sudo apt-get install bazel
   - sudo apt-get upgrade bazel
   - If you want to know whether bazel correctly installed w/o errors, type bazel-version on your terminal

2. turn on your anaconda env

3. sudo apt-get install python-numpy swig python-dev

4. sudo apt-get install git

5. git clone --recurse-submodules https://github.com/tensorflow/tensorflow

6. cd ~/tensorflow

7. ./configure

8. follow like this 

https://www.tensorflow.org/install/install_sources

9. bazel build -c opt --copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-mfpmath=both --copt=-msse4.2 --config=cuda -k //tensorflow/tools/pip_package:build_pip_package

9. pip install wheel

10. bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

11. pip install /tmp/tensorflow_pkg/tensorflow-1.0.0-cp27-cp27mu-linux_x86_64.whl

12. Done!

----------------------------------------------------

-- To install system monitor widget

1. sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor

2. sudo apt-get update

3. sudo apt-get install indicator-sysmonitor

4. open system monitor indicator

---------------------------------------------------

-- How to freeze the trained network in Tensorflow

0. you need .ckpt file and .pb file.

1. .ckpt file and .pb file contain weight parameters and graph structure, respectively.

2. move to your tensorflow source folder (installed location) e.g, /home/user_ID/tensorflow

3. open terminal and type $ bazel build tensorflow/python/tools:freeze_graph

4. after that, type 

bazel-bin/tensorflow/python/tools/freeze_graph \
--input_graph=/your/path/Graph.pb \
--input_checkpoint=/your/path/Weight.ckpt \
--output_graph=/your/path/output_pb/frozen_graph.pb \
--output_node_names=name_of_output

5. ** name_of_output ** is the scope name of your prediction layer. When you print out your prediction layer, it produces like this, if you type 'net/logits' as the scope name; 
Out[2]: <tf.Tensor 'net/logits:0' shape=(?, 7) dtype=float32>

6. If so, name_of_output should be net/logits (not :0 attatched)

------
%%% If nvidia additional driver is absent, type these instructions

1. sudo add-apt-repository ppa:graphics-drivers/ppa
2. sudo apt-get update

%%% then back to additional driver tap, you can find nvidia additional driver for ubuntu 16.04
