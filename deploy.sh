#!/bin/bash

Py2=Python-2.7.13
Py3=Python-3.6.3

PyHome2=~/local/py2.7
PyHome3=~/local/py3.6

PyEnv2=~/vpy/py2.7
PyEnv3=~/vpy/py3.6

mkdir -p $PyHome2
mkdir -p $PyHome3

tar xvzf $Py2.tgz 
tar xvzf $Py3.tgz 

cd $Py2
./configure
make altinstall prefix=$PyHome2 -j 16

cd ..
cd $Py3
./configure
make altinstall prefix=$PyHome3 -j 16

export PATH=$PATH:$PyHome3/bin
python3.6 -m venv $PyEnv3

cd ..
cp get-pip.py ~
mkdir -p ~/.local/bin
export PATH=$PATH:$PyHome2/bin:~/.local/bin
cd ~
python2.7 get-pip.py --user
pip2.7 install virtualenv --user -i https://pypi.douban.com/simple
virtualenv -p $PyHome2/bin/python2.7 $PyEnv2



