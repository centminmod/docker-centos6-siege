#!/bin/bash
###############################################
# siege install for docker containers
# based on centminmod.com install routine
# by George Liu vbtechsupport.com
# http://www.joedog.org/siege-home/
# https://github.com/wg/wrk.git
# https://github.com/giltene/wrk2
# https://github.com/shekyan/slowhttptest
# https://github.com/httperf/httperf
###############################################
SIEGE_VERSION=3.1.0
DIR_TMP=/usr/local/src

SSLDIR_TMP=/usr/local/src/docker_openssl
STATICLIBSSL=/opt/docker_openssl
###############################################
SIEGE_LINKFILE="siege-${SIEGE_VERSION}.tar.gz"
SIEGE_LINK="http://download.joedog.org/siege/${SIEGE_LINKFILE}"
SPROXY_LINKFILE="sproxy-latest.tar.gz"
SPROXY_LINK="http://download.joedog.org/sproxy/${SPROXY_LINKFILE}"
WRK_LINK='https://github.com/wg/wrk.git'
WRKTWO_LINK='https://github.com/giltene/wrk2.git'
WEIGHTTP='http://cgit.lighttpd.net/weighttp.git/snapshot/weighttp-master.tar.gz'
SLOWHTTP='https://github.com/shekyan/slowhttptest.git'
HTTPERF_LINK='https://github.com/httperf/httperf.git'
###############################################
#

if [ -f /proc/user_beancounters ]; then
    CPUS=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
    MAKETHREADS=" -j$CPUS"
else
    # speed up make
    CPUS=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
    MAKETHREADS=" -j$CPUS"
fi

staticssl() {
	# Build static openssl
	if [ ! -d "$SSLDIR_TMP" ]; then
		# mkdir $SSLDIR_TMP
		cd $DIR_TMP
		if [ -d ${DIR_TMP}/docker_openssl ]; then
			rm -rf ${DIR_TMP}/docker_openssl
		fi
		git clone --depth 1 https://github.com/PeterMosmans/openssl.git docker_openssl -b 1.0.2-chacha
	fi

    rm -rf "$STATICLIBSSL"
    mkdir -p "$STATICLIBSSL"
    # cd openssl-${OPENSSL_VERSION}
    cd $SSLDIR_TMP
    make clean
    # enable-ec_nistp_64_gcc_128 option only supported in 64bit linux
    if [[ "$(uname -m)" = 'x86_64' ]]; then
    	./config --prefix=${STATICLIBSSL} --openssldir=${STATICLIBSSL}/ssl enable-threads zlib shared experimental-jpake enable-md2 enable-rc5 enable-rfc3779 enable-gost enable-static-engine enable-ec_nistp_64_gcc_128
	else
		./config --prefix=${STATICLIBSSL} --openssldir=${STATICLIBSSL}/ssl enable-threads zlib shared
	fi
    # make depend
    make${MAKETHREADS}
    make install

    echo
    echo "OpenSSL static prefix ${STATICLIBSSL}"
    echo "openssldir ${STATICLIBSSL}/ssl"
    /opt/docker_openssl/bin/openssl version
    
    echo
    echo "ls -lah ${STATICLIBSSL}"
    ls -lah ${STATICLIBSSL}
    echo
}

yumpkg() {
	yum -y install libtool autoconf automake make gcc libevent libevent-devel
    yum clean all && rm -rf /var/cache/*
}

install() {

cd $DIR_TMP
wget -cnv ${SIEGE_LINK}
tar -xzf siege-${SIEGE_VERSION}.tar.gz
rm -rf siege-${SIEGE_VERSION}.tar.gz
cd siege-3*
./configure --with-ssl=/usr
make
make install
mkdir -p /usr/local/var/
sed -i 's/# failures =/failures = 2048/g' /usr/local/etc/siegerc

cd $DIR_TMP
wget -cnv $SPROXY_LINK
tar -xzf sproxy-latest.tar.gz
rm -rf sproxy-latest.tar.gz
cd sproxy-1*
./configure
make
make install

cd $DIR_TMP
git clone $WRK_LINK
cd wrk
make
\cp -f wrk /usr/bin/wrk

cd $DIR_TMP
git clone $WRKTWO_LINK
cd wrk2
make
\cp -f wrk /usr/bin/wrk2

cd $DIR_TMP
wget -cnv $WEIGHTTP
tar xzf weighttp-master.tar.gz
rm -rf weighttp-master.tar.gz
cd weighttp-master
CFLAGS=-I/usr/include/libev ./waf configure -vvv
./waf build
./waf install

cd $DIR_TMP
git clone $SLOWHTTP slowhttptest
cd slowhttptest
./configure --prefix=/usr
make
make install

cd $DIR_TMP
git clone $HTTPERF_LINK httperf
cd ${DIR_TMP}/httperf
autoreconf -i
mkdir build
cd build
# CPPFLAGS="-I${STATICLIBSSL}/include" LDFLAGS="-L${STATICLIBSSL}/lib" ../configure --enable-idleconn
../configure --enable-idleconn
make
make install

}
###########################
yumpkg
#staticssl
install
exit