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

Commands supported include siege, wrk, wrk2, sproxy, mtr, ping, lynx, wget, curl and traceroute

For Siege

    siege -h
    SIEGE 3.0.8
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