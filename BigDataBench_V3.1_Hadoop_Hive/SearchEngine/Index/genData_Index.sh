#!/bin/bash
##
# Micro Benchmarks Workload: sort, grep, wordcount
# Need HADOOP 
##

if [ ! -e $HADOOP ]; then
  echo "Can't find hadoop in $HADOOP, exiting"
  exit 1
fi

echo "Preparing MicroBenchmarks data dir"

WORK_DIR=`pwd`
echo "WORK_DIR=$WORK_DIR data will be put in $WORK_DIR/data-Index"

mkdir -p ${WORK_DIR}/data-Index

cd ../../BigDataGeneratorSuite/Text_datagen/

echo "print data size GB :"
read GB
a=${GB}
let L=a*2
./gen_text_data.sh lda_wiki1w $L 8000 10000 ${WORK_DIR}/data-Index

cd ../../SearchEngine/Index/
${HADOOP_HOME}/bin/hadoop fs -rmr /data-Index
${HADOOP_HOME}/bin/hadoop fs -copyFromLocal ${WORK_DIR}/data-Index /

