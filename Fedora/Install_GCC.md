### Preparing basic packages and source code
```
sudo dnf install glibc-devel.i686 glibc-devel
```

```
cd ~/Downloads
git clone https://github.com/gcc-mirror/gcc.git
cd gcc
```
Check and switch version required by command `git branch -a` and checkout to specific branch you need
```
git checkout remotes/origin/releases/gcc-11
./contrib/download_prerequisites
```

### Build and Installation
```
mkdir build && cd build
../configure --prefix=/usr/local/gcc-11 --enable-bootstrap --enable-languages=c,c++ --enable-threads=posix --enable-checking=release --enable-multilib --with-system-zlib
make --jobs=$(nproc --all)
sudo make install
```

### Set alternatives and manage symlinks
Assume we have current gcc version 12.2.1 (Check gcc version by `gcc -v` and g++ by `g++ -v`)
```
sudo mv /usr/bin/gcc /usr/bin/gcc-12.2.1
sudo alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12.2.1 100
sudo alternatives --install /usr/bin/gcc gcc /usr/local/gcc-11/bin/gcc 90

sudo mv /usr/bin/g++ /usr/bin/g++-12.2.1
sudo alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12.2.1 100
sudo alternatives --install /usr/bin/g++ g++ /usr/local/gcc-11/bin/g++ 90
```

### Apply alternatives
```
sudo alternatives --config gcc
```
Enter the number of selection you specify
```
sudo alternatives --config g++
```
Likewise, enter the number of selection you specify,
