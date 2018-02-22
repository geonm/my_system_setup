I want to share my experience for ncnn, which was published by tencent.

----------------------------------
How to build 'ncnn'
1. check whether youve already installed protobuf**

$ sudo apt-get install protobuf-compiler

$ sudo apt-get install libprotobuf-dev

2. clone git from 'https://github.com/Tencent/ncnn'

$ cd <ncnn-root-dir>

uncomment add_subdirectory(examples) in CMakeLists.txt with your favorite editor

$ mkdir -p build

$ cd build

$ cmake ..

$ make -j4

3. If you are using anaconda*_package, please change libgomp* and libstdc++.*.

How To Find libgomp* and libstdc++.*

$ sudo find / name -name libgomp.so.1

then, copy it from '/usr/lib/x86_64-linux-gnu/' to 'anaconda/lib/folder'

4. Let's test squeezenet, which has been already converted using 'ncnn'

copy examples/squeezenet_v1.1.param to build/examples

copy examples/squeezenet_v1.1.bin to build/examples

then,

$ cd build/examples

$ ./squeezenet yourimage.jpg

output top-3 class-id and score

you may refer examples/synset_words.txt to find the class name

404 = 0.990290

908 = 0.004464

405 = 0.003941

