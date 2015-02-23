Docker based image for Siege http / https load tester benchmark tool on CentOS 6.6 intended for use with [CentminMod.com LEMP stack](http://centminmod.com). 

### My Docker Hub repo

* [https://registry.hub.docker.com/u/centminmod/docker-centos6-siege/](https://registry.hub.docker.com/u/centminmod/docker-centos6-siege/)

### My Quay.io repo

* [https://quay.io/repository/centminmod/docker-centos6-siege/](https://quay.io/repository/centminmod/docker-centos6-siege/)

### Centmin Mod Docker Development forums

* [https://community.centminmod.com/forums/centmin-mod-docker-development.52/](https://community.centminmod.com/forums/centmin-mod-docker-development.52/)

---

#### Grab from Docker Hub

    docker pull centminmod/docker-centos6-siege

#### Or grab from Quay.io Repo

    docker pull quay.io/centminmod/docker-centos6-siege:latest

Run docker container and from there you can launch Siege http/https load testing tool [http://www.joedog.org/siege-manual/](http://www.joedog.org/siege-manual/)

    docker run -ti --name siegecmd centminmod/docker-centos6-siege /bin/bash

Commands supported include siege, ab (apache bench), wrk, wrk2, weighttp, slowhttptest, sproxy, mtr, ping, lynx, wget, curl and traceroute

For Siege

    siege -h
    SIEGE 3.0.9
    Usage: siege [options]
           siege [options] URL
           siege -g URL
    Options:
      -V, --version             VERSION, prints the version number.
      -h, --help                HELP, prints this section.
      -C, --config              CONFIGURATION, show the current config.
      -v, --verbose             VERBOSE, prints notification to screen.
      -q, --quiet               QUIET turns verbose off and suppresses output.
      -g, --get                 GET, pull down HTTP headers and display the
                                transaction. Great for application debugging.
      -c, --concurrent=NUM      CONCURRENT users, default is 10
      -i, --internet            INTERNET user simulation, hits URLs randomly.
      -b, --benchmark           BENCHMARK: no delays between requests.
      -t, --time=NUMm           TIMED testing where "m" is modifier S, M, or H
                                ex: --time=1H, one hour test.
      -r, --reps=NUM            REPS, number of times to run the test.
      -f, --file=FILE           FILE, select a specific URLS FILE.
      -R, --rc=FILE             RC, specify an siegerc file
      -l, --log[=FILE]          LOG to FILE. If FILE is not specified, the
                                default is used: PREFIX/var/siege.log
      -m, --mark="text"         MARK, mark the log file with a string.
      -d, --delay=NUM           Time DELAY, random delay before each requst
                                between 1 and NUM. (NOT COUNTED IN STATS)
      -H, --header="text"       Add a header to request (can be many)
      -A, --user-agent="text"   Sets User-Agent in request
      -T, --content-type="text" Sets Content-Type in request


For sproxy

    sproxy -h
    sproxy v1.02-August-05-2014
    Usage:      sproxy [options] [hostname]
                (If a hostname is not specified, then sproxy will bind
                to localhost [127.0.0.1])
    Options:
      -V        VERSION, prints version number to screen.
      -v        Verbose, prints URLS to screen.
      -h        Help, prints this section.
      -t NUM    Timeout, set the sproxy connection timeout to NUMM (default 120)
      -p NUM    Port, specify the port on which sproxy will listen for 
                incoming connections (default 9001)
      -f FILE   File, specify an alternative configuration file. 
                (default $prefix/etc/sproxy.conf)
      -o FILE   Output file, specify an alternative file to write URLs.
                (default $HOME/urls.txt)

For mtr

    mtr -v
    mtr 0.75
    
    mtr --help
    usage: mtr [-hvrwctglspniu46] [--help] [--version] [--report]
                    [--report-wide] [--report-cycles=COUNT] [--curses] [--gtk]
                    [--raw] [--split] [--no-dns] [--address interface]
                    [--psize=bytes/-s bytes]
                    [--interval=SECONDS] HOSTNAME [PACKETSIZE]

For wrk https://github.com/wg/wrk.git

    wrk -v
    wrk 3.1.2 [epoll] Copyright (C) 2012 Will Glozer
    Usage: wrk <options> <url>                            
      Options:                                            
        -c, --connections <N>  Connections to keep open   
        -d, --duration    <T>  Duration of test           
        -t, --threads     <N>  Number of threads to use   
                                                          
        -s, --script      <S>  Load Lua script file       
        -H, --header      <H>  Add header to request      
            --latency          Print latency statistics   
            --timeout     <T>  Socket/request timeout     
        -v, --version          Print version details      
                                                          
      Numeric arguments may include a SI unit (1k, 1M, 1G)
      Time arguments may include a time unit (2s, 2m, 2h)

For wrk2 https://github.com/giltene/wrk2

    wrk2 -v
    wrk 3.1.1 [epoll] Copyright (C) 2012 Will Glozer
    Usage: wrk <options> <url>                            
      Options:                                            
        -c, --connections <N>  Connections to keep open   
        -d, --duration    <T>  Duration of test           
        -t, --threads     <N>  Number of threads to use   
                                                          
        -s, --script      <S>  Load Lua script file       
        -H, --header      <H>  Add header to request      
        -L  --latency          Print latency statistics   
        -U  --u_latency        Print uncorrceted latency statistics
            --timeout     <T>  Socket/request timeout     
        -B, --batch_latency    Measure latency of whole   
                               batches of pipelined ops   
                               (as opposed to each op)    
        -v, --version          Print version details      
        -R, --rate        <T>  work rate (throughput)     
                               in requests/sec (total)    
                               [Required Parameter]                                                          
                                                          
      Numeric arguments may include a SI unit (1k, 1M, 1G)
      Time arguments may include a time unit (2s, 2m, 2h)

For weighttp http://cgit.lighttpd.net/weighttp.git

    weighttp - a lightweight and simple webserver benchmarking tool
    
    weighttp <options> <url>
      -n num   number of requests    (mandatory)
      -t num   threadcount           (default: 1)
      -c num   concurrent clients    (default: 1)
      -k       keep alive            (default: no)
      -6       use ipv6              (default: no)
      -H str   add header to request
      -h       show help and exit
      -v       show version and exit
    
    example: weighttpd -n 10000 -c 10 -t 2 -k -H "User-Agent: foo" localhost/index.html

For slowhttptest https://code.google.com/p/slowhttptest/

    slowhttptest -h
    
    slowhttptest, a tool to test for slow HTTP DoS vulnerabilities - version 1.6
    Usage: slowhttptest [options ...]
    Test modes:
      -H               slow headers a.k.a. Slowloris (default)
      -B               slow body a.k.a R-U-Dead-Yet
      -R               range attack a.k.a Apache killer
      -X               slow read a.k.a Slow Read
    
    Reporting options:
    
      -g               generate statistics with socket state changes (off)
      -o file_prefix   save statistics output in file.html and file.csv (-g required)
      -v level         verbosity level 0-4: Fatal, Info, Error, Warning, Debug
    
    General options:
    
      -c connections   target number of connections (50)
      -i seconds       interval between followup data in seconds (10)
      -l seconds       target test length in seconds (240)
      -r rate          connections per seconds (50)
      -s bytes         value of Content-Length header if needed (4096)
      -t verb          verb to use in request, default to GET for
                       slow headers and response and to POST for slow body
      -u URL           absolute URL of target (http://localhost/)
      -x bytes         max length of each randomized name/value pair of
                       followup data per tick, e.g. -x 2 generates
                       X-xx: xx for header or &xx=xx for body, where x
                       is random character (32)
    
    Probe/Proxy options:
    
      -d host:port     all traffic directed through HTTP proxy at host:port (off)
      -e host:port     probe traffic directed through HTTP proxy at host:port (off)
      -p seconds       timeout to wait for HTTP response on probe connection,
                       after which server is considered inaccessible (5)
    
    Range attack specific options:
    
      -a start        left boundary of range in range header (5)
      -b bytes        limit for range header right boundary values (2000)
    
    Slow read specific options:
    
      -k num          number of times to repeat same request in the connection. Use to
                      multiply response size if server supports persistent connections (1)
      -n seconds      interval between read operations from recv buffer in seconds (1)
      -w bytes        start of the range advertised window size would be picked from (1)
      -y bytes        end of the range advertised window size would be picked from (512)
      -z bytes        bytes to slow read from receive buffer with single read() call (5)

For ab (apache bench)

    ab -h
    Usage: ab [options] [http[s]://]hostname[:port]/path
    Options are:
        -n requests     Number of requests to perform
        -c concurrency  Number of multiple requests to make
        -t timelimit    Seconds to max. wait for responses
        -b windowsize   Size of TCP send/receive buffer, in bytes
        -p postfile     File containing data to POST. Remember also to set -T
        -u putfile      File containing data to PUT. Remember also to set -T
        -T content-type Content-type header for POSTing, eg.
                        'application/x-www-form-urlencoded'
                        Default is 'text/plain'
        -v verbosity    How much troubleshooting info to print
        -w              Print out results in HTML tables
        -i              Use HEAD instead of GET
        -x attributes   String to insert as table attributes
        -y attributes   String to insert as tr attributes
        -z attributes   String to insert as td or th attributes
        -C attribute    Add cookie, eg. 'Apache=1234. (repeatable)
        -H attribute    Add Arbitrary header line, eg. 'Accept-Encoding: gzip'
                        Inserted after all normal header lines. (repeatable)
        -A attribute    Add Basic WWW Authentication, the attributes
                        are a colon separated username and password.
        -P attribute    Add Basic Proxy Authentication, the attributes
                        are a colon separated username and password.
        -X proxy:port   Proxyserver and port number to use
        -V              Print version number and exit
        -k              Use HTTP KeepAlive feature
        -d              Do not show percentiles served table.
        -S              Do not show confidence estimators and warnings.
        -g filename     Output collected data to gnuplot format file.
        -e filename     Output CSV file with percentages served
        -r              Don't exit on socket receive errors.
        -h              Display usage information (this message)
        -Z ciphersuite  Specify SSL/TLS cipher suite (See openssl ciphers)
        -f protocol     Specify SSL/TLS protocol (SSL2, SSL3, TLS1, or ALL)