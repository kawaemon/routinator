#!/bin/bash

set -exu

cargo b --release
/usr/bin/time -f 'took %E, used %M KB' ./target/release/routinator validate -i <(head -n 100000 ./.kprivate/fullroute.routinator.txt) -o ./.kprivate/$(git branch --show-current).txt --noupdate
