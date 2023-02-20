### Preparing basic packages and source code
```
sudo dnf install glibc-devel.i686 glibc-devel
```

```
cd ~/Downloads
git clone https://github.com/gcc-mirror/gcc.git
cd gcc
```
Check and switch version required by command `git branch -a` and checkout to specific branch
```
git checkout remotes/origin/releases/gcc-11
./contrib/download_prerequisites
```

### Build and Installation
```
./configure --prefix=/usr/local/gcc-11 --enable-bootstrap --enable-languages=c,c++ --enable-threads=posix --enable-checking=release --enable-multilib --with-system-zlib
make --jobs=$(nproc --all)
sudo make install
```
