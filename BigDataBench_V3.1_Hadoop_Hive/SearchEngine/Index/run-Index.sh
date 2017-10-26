WORK_DIR=`pwd`
echo "Please write you IP:"
read IP
echo "Please write you IP PORT:"
read PORT
nohup java -jar indexdata.jar ${WORK_DIR}/result hdfs://$IP:$PORT/data-Index > Index.out
