### before
```
> ./bench.bash
+ cargo b --release
   Compiling num-traits v0.2.19
   Compiling chrono v0.4.42
   Compiling rpki v0.19.1
   Compiling routinator v0.15.1 (/home/kawak/repo/github.com/NLnetLabs/routinator)
    Finished `release` profile [optimized] target(s) in 8.55s
+ ./target/release/routinator validate -i /dev/fd/63 -o ./.kprivate/after.txt --noupdate
++ head -n 100000 ./.kprivate/fullroute.routinator.txt
    Command being timed: "./target/release/routinator validate -i /dev/fd/63 -o ./.kprivate/before.txt --noupdate"
    User time (seconds): 194.97
    System time (seconds): 0.91
    Percent of CPU this job got: 103%
    Elapsed (wall clock) time (h:mm:ss or m:ss): 3:08.90
    Average shared text size (kbytes): 0
    Average unshared data size (kbytes): 0
    Average stack size (kbytes): 0
    Average total size (kbytes): 0
    Maximum resident set size (kbytes): 438696
    Average resident set size (kbytes): 0
    Major (requiring I/O) page faults: 0
    Minor (reclaiming a frame) page faults: 74351
    Voluntary context switches: 103
    Involuntary context switches: 1193
    Swaps: 0
    File system inputs: 0
    File system outputs: 7808
    Socket messages sent: 0
    Socket messages received: 0
    Signals delivered: 0
    Page size (bytes): 4096
    Exit status: 0
    > ./bench.bash
+ cargo b --release
    Finished `release` profile [optimized] target(s) in 0.05s
+ /usr/bin/time -v ./target/release/routinator validate -i /dev/fd/63 -o ./.kprivate/before.txt --noupdate
++ head -n 100000 ./.kprivate/fullroute.routinator.txt
    Command being timed: "./target/release/routinator validate -i /dev/fd/63 -o ./.kprivate/before.txt --noupdate"
    User time (seconds): 195.05
    System time (seconds): 0.75
    Percent of CPU this job got: 103%
    Elapsed (wall clock) time (h:mm:ss or m:ss): 3:08.59
    Average shared text size (kbytes): 0
    Average unshared data size (kbytes): 0
    Average stack size (kbytes): 0
    Average total size (kbytes): 0
    Maximum resident set size (kbytes): 439840
    Average resident set size (kbytes): 0
    Major (requiring I/O) page faults: 0
    Minor (reclaiming a frame) page faults: 73628
    Voluntary context switches: 145
    Involuntary context switches: 1219
    Swaps: 0
    File system inputs: 0
    File system outputs: 7808
    Socket messages sent: 0
    Socket messages received: 0
    Signals delivered: 0
    Page size (bytes): 4096
    Exit status: 0
```


### after

```
> ./bench.bash
+ cargo b --release
   Compiling routinator v0.15.1 (/home/kawak/repo/github.com/NLnetLabs/routinator)
    Finished `release` profile [optimized] target(s) in 5.15s
+ /usr/bin/time -v ./target/release/routinator validate -i /dev/fd/63 -o ./.kprivate/before.txt --noupdate
++ head -n 100000 ./.kprivate/fullroute.routinator.txt
    Command being timed: "./target/release/routinator validate -i /dev/fd/63 -o ./.kprivate/before.txt --noupdate"
    User time (seconds): 17.30
    System time (seconds): 0.71
    Percent of CPU this job got: 188%
    Elapsed (wall clock) time (h:mm:ss or m:ss): 0:09.55
    Average shared text size (kbytes): 0
    Average unshared data size (kbytes): 0
    Average stack size (kbytes): 0
    Average total size (kbytes): 0
    Maximum resident set size (kbytes): 674508
    Average resident set size (kbytes): 0
    Major (requiring I/O) page faults: 0
    Minor (reclaiming a frame) page faults: 122099
    Voluntary context switches: 139
    Involuntary context switches: 70
    Swaps: 0
    File system inputs: 0
    File system outputs: 7808
    Socket messages sent: 0
    Socket messages received: 0
    Signals delivered: 0
    Page size (bytes): 4096
    Exit status: 0
> ./bench.bash
+ cargo b --release
    Finished `release` profile [optimized] target(s) in 0.05s
+ /usr/bin/time -v ./target/release/routinator validate -i /dev/fd/63 -o ./.kprivate/before.txt --noupdate
++ head -n 100000 ./.kprivate/fullroute.routinator.txt
    Command being timed: "./target/release/routinator validate -i /dev/fd/63 -o ./.kprivate/before.txt --noupdate"
    User time (seconds): 17.32
    System time (seconds): 0.67
    Percent of CPU this job got: 188%
    Elapsed (wall clock) time (h:mm:ss or m:ss): 0:09.56
    Average shared text size (kbytes): 0
    Average unshared data size (kbytes): 0
    Average stack size (kbytes): 0
    Average total size (kbytes): 0
    Maximum resident set size (kbytes): 674100
    Average resident set size (kbytes): 0
    Major (requiring I/O) page faults: 0
    Minor (reclaiming a frame) page faults: 121896
    Voluntary context switches: 101
    Involuntary context switches: 80
    Swaps: 0
    File system inputs: 0
    File system outputs: 7808
    Socket messages sent: 0
    Socket messages received: 0
    Signals delivered: 0
    Page size (bytes): 4096
    Exit status: 0
```

```
------
n = 10
old:
took 17ms
new:
took 143ms
new is 0.119x faster
verification pass

------
n = 100
old:
took 171ms
new:
took 145ms
new is 1.184x faster
verification pass

------
n = 1000
old:
took 1702ms
new:
took 141ms
new is 12.058x faster
verification pass

------
n = 10000
old:
took 17102ms
new:
took 145ms
new is 117.934x faster
verification pass

------
n = 100000
old:
took 177631ms
new:
took 165ms
new is 1074.853x faster
verification pass

------
n = 1000000
old:
took 2083921ms
new:
took 368ms
new is 5652.506x faster
verification pass
```
