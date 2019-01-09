#背景

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;国内苦防火墙久矣，正直aws有一年的免费套餐，选国外服务器，搭建翻墙服务，何乐不为

#步骤
[shadowsocks](https://github.com/shadowsocks/shadowsocks-libev) 翻墙利器，考虑到aws免费套餐太弱，使用C语言版本

安装依赖

```
#centos
yum install gettext gcc autoconf libtool automake make asciidoc xmlto c-ares-devel libev-devel
# Installation of libsodium
export LIBSODIUM_VER=1.0.16
wget https://download.libsodium.org/libsodium/releases/libsodium-$LIBSODIUM_VER.tar.gz
tar xvf libsodium-$LIBSODIUM_VER.tar.gz
pushd libsodium-$LIBSODIUM_VER
./configure --prefix=/usr && make
sudo make install
popd
sudo ldconfig

# Installation of MbedTLS
export MBEDTLS_VER=2.6.0
wget https://tls.mbed.org/download/mbedtls-$MBEDTLS_VER-gpl.tgz
tar xvf mbedtls-$MBEDTLS_VER-gpl.tgz
pushd mbedtls-$MBEDTLS_VER
make SHARED=1 CFLAGS=-fPIC
sudo make DESTDIR=/usr install
popd
sudo ldconfig

# may libdev can't find,you can search 
rpm -ivh http://mirror.centos.org/centos/7/extras/x86_64/Packages/libev-4.15-7.el7.x86_64.rpm
rpm -ivh http://mirror.centos.org/centos/7/extras/x86_64/Packages/libev-devel-4.15-7.el7.x86_64.rpm

# Start building
./autogen.sh && ./configure --disable-documentation && make
sudo make install
```
配置/etc/shadowsocks.json

```
{
    "server":"0.0.0.0",
    "server_port":12345,
    "password":"helloworld",
    "timeout":600,
    "method":"aes-256-cfb"
}
```
启动server

```
#!/usr/bin/env bash
set -ex

cd $(dirname $0)

case $1 in
start)
	echo "start server"
	nohup ss-server -v -c ./etc/shadowsocks.json  2>&1 >> /var/log/ss-server.log &
	;;
stop)
	echo "kill server"
	ps -ef |grep ss-server|grep -v grep |awk '{print $2}'|xargs kill -9
	;;
*)
	echo -e "usage:\n\tstart start server\n\tstop kill server\n"
esac
```
命令行使用shadowsocks，参考privoxy

#参考
<lo>
<li>https://my.oschina.net/zk875/blog/853410
<lo>
