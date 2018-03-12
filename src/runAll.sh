#!/bin/bash


#single thread---------------------------
##div = 1

echo "starting single thread";
/bin/date

perf stat -I 1500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_1_1.csv sudo docker run -e THREAD=1 -e DIV=1 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_1_1.csv > ./csv/out_1_1.csv

###div = 4
#ocperf.py stat ./test 4
perf stat -I 500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_1_4.csv sudo docker run -e THREAD=1 -e DIV=4 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_1_4.csv > ./csv/out_1_4.csv

###div = 16
#ocperf.py stat ./test 16
perf stat -I 160 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_1_16.csv sudo docker run -e THREAD=1 -e DIV=16 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_1_16.csv > ./csv/out_1_16.csv


###div = 64
#ocperf.py stat ./test 64
perf stat -I 40 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_1_64.csv sudo docker run -e THREAD=1 -e DIV=64 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_1_64.csv > ./csv/out_1_64.csv


###div = 256
#ocperf.py stat ./test 256
perf stat -I 10 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_1_256.csv sudo docker run -e THREAD=1 -e DIV=256 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_1_256.csv > ./csv/out_1_256.csv

echo "starting double thread";
/bin/date

perf stat -I 1500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_2_1.csv sudo docker run -e THREAD=2 -e DIV=1 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_2_1.csv > ./csv/out_2_1.csv

##div = 4
perf stat -I 500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_2_4.csv sudo docker run -e THREAD=2 -e DIV=4 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_2_4.csv > ./csv/out_2_4.csv

###div = 16
#ocperf.py stat ./test 16
perf stat -I 160 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_2_16.csv sudo docker run -e THREAD=2 -e DIV=16 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_2_16.csv > ./csv/out_2_16.csv


###div = 64
#ocperf.py stat ./test 64
perf stat -I 40 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_2_64.csv sudo docker run -e THREAD=2 -e DIV=64 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_2_64.csv > ./csv/out_2_64.csv


###div = 256
#ocperf.py stat ./test 256
perf stat -I 10 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_2_256.csv sudo docker run -e THREAD=2 -e DIV=256 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_2_256.csv > ./csv/out_2_256.csv




echo "starting four threads";
/bin/date


perf stat -I 1500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_4_1.csv sudo docker run -e THREAD=4 -e DIV=1 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_4_1.csv > ./csv/out_4_1.csv

###div = 4
#ocperf.py stat ./test 4
perf stat -I 500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_4_4.csv sudo docker run -e THREAD=4 -e DIV=4 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_4_4.csv > ./csv/out_4_4.csv

###div = 16
#ocperf.py stat ./test 16
perf stat -I 160 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_4_16.csv sudo docker run -e THREAD=4 -e DIV=16 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_4_16.csv > ./csv/out_4_16.csv


###div = 64
#ocperf.py stat ./test 64
perf stat -I 40 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_4_64.csv sudo docker run -e THREAD=4 -e DIV=64 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_4_64.csv > ./csv/out_4_64.csv


###div = 256
#ocperf.py stat ./test 256
perf stat -I 10 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_4_256.csv sudo docker run -e THREAD=4 -e DIV=256 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_4_256.csv > ./csv/out_4_256.csv

echo "starting eight thread";
/bin/date

perf stat -I 1500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_8_1.csv sudo docker run -e THREAD=8 -e DIV=1 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_8_1.csv > ./csv/out_8_1.csv

##div = 4
perf stat -I 500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_8_4.csv sudo docker run -e THREAD=8 -e DIV=4 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_8_4.csv > ./csv/out_8_4.csv

###div = 16
#ocperf.py stat ./test 16
perf stat -I 160 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_8_16.csv sudo docker run -e THREAD=8 -e DIV=16 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_8_16.csv > ./csv/out_8_16.csv


###div = 64
#ocperf.py stat ./test 64
perf stat -I 40 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_8_64.csv sudo docker run -e THREAD=8 -e DIV=64 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_8_64.csv > ./csv/out_8_64.csv


###div = 256
#ocperf.py stat ./test 256
perf stat -I 10 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o ./csv/in_8_256.csv sudo docker run -e THREAD=8 -e DIV=256 pranav93y/gosl-benchmark:throughput
interval-normalize.py ./csv/in_8_256.csv > ./csv/out_8_256.csv





