#!/bin/bash
docker run -d --rm --net container:mininet -v $(pwd)/tcpdump/$1/:/home --workdir /home --name src_out   tcpdump tcpdump -i leaf1-eth1 -w with_srv6_source_out.dump
docker run -d --rm --net container:mininet -v $(pwd)/tcpdump/$1/:/home --workdir /home --name src_in    tcpdump tcpdump -i leaf1-eth6 -w with_srv6_source_in.dump
docker run -d --rm --net container:mininet -v $(pwd)/tcpdump/$1/:/home --workdir /home --name spine_in  tcpdump tcpdump -i spine1-eth1 -w with_srv6_spine_in.dump
docker run -d --rm --net container:mininet -v $(pwd)/tcpdump/$1/:/home --workdir /home --name spine_out tcpdump tcpdump -i spine1-eth2 -w with_srv6_spine_out.dump
docker run -d --rm --net container:mininet -v $(pwd)/tcpdump/$1/:/home --workdir /home --name dest_in   tcpdump tcpdump -i leaf2-eth1 -w with_srv6_dest_in.dump
docker run -d --rm --net container:mininet -v $(pwd)/tcpdump/$1/:/home --workdir /home --name dest_out  tcpdump tcpdump -i leaf2-eth4 -w with_srv6_dest_out.dump
