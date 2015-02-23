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

Commands supported include siege, sproxy, mtr, ping, lynx, wget, curl and traceroute

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


