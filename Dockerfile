FROM centos:6.6
MAINTAINER George Liu <https://github.com/centminmod/docker-centos6-siege>
# Setup Siege benchmark http load tester on CentOS 6
RUN ulimit -c -m -s -t unlimited && yum -y install awk httpd-tools epel-release binutils file make which nano bc traceroute mtr ping hostname wget git lynx make gcc gcc-c++ automake screen unzip tar perl-libwww-perl perl-MIME-Base64 perl-MIME-Base64-Perl perl-URI perl-Digest-MD5 perl-HTML-Parser perl-ExtUtils-MakeMaker openssl openssl-devel perl-Net-SSLeay --disableplugin=fastestmirror && mkdir -p /root/tools && yum -y install libev libev-devel libev-source && yum clean all && rm -rf /var/cache/*
ADD siegesetup.sh /root/tools/siegesetup.sh
RUN chmod +x /root/tools/siegesetup.sh && /root/tools/siegesetup.sh && yum -y update --disableplugin=fastestmirror && yum clean all && rm -rf /var/cache/* && echo && wrk -v ; echo; wrk2 -v ; echo; slowhttptest -h | awk '/version / {print "slowhttptest",$13}'; echo; weighttp -v; echo; ab -V; echo; siege -V