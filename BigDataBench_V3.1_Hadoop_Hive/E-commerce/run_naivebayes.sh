#!/bin/bash
WORK_DIR=`pwd`
cd mahout-distribution-0.6/bin
time ./mahout testclassifier -m /Bayes/model -d  ${WORK_DIR}/data-naivebayes/testdata 

