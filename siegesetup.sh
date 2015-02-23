#!/bin/bash
###############################################
# siege install for docker containers
# based on centminmod.com install routine
# by George Liu vbtechsupport.com
# http://www.joedog.org/siege-home/
# https://github.com/wg/wrk.git
# https://github.com/giltene/wrk2
###############################################
SIEGE_VERSION=latest
DIR_TMP=/usr/local/src
###############################################
SIEGE_LINKFILE="siege-${SIEGE_VERSION}.tar.gz"
SIEGE_LINK="http://download.joedog.org/siege/${SIEGE_LINKFILE}"
SPROXY_LINKFILE="sproxy-latest.tar.gz"
SPROXY_LINK="http://download.joedog.org/sproxy/${SPROXY_LINKFILE}"
WRK_LINK='https://github.com/wg/wrk.git'
WRKTWO_LINK='https://github.com/giltene/wrk2.git'
###############################################
install() {
cd $DIR_TMP

wget -cnv ${SIEGE_LINK}
tar -xzf siege-${SIEGE_VERSION}.tar.gz
rm -rf siege-${SIEGE_VERSION}.tar.gz
cd siege-3*
./configure
make -j2
make install
mkdir -p /usr/local/var/
sed -i 's/# failures =/failures = 2048/g' /usr/local/etc/siegerc

cd $DIR_TMP
wget -cnv $SPROXY_LINK
tar -xzf sproxy-latest.tar.gz
rm -rf sproxy-latest.tar.gz
cd sproxy-1*
./configure
make -j2
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
}
install
exit