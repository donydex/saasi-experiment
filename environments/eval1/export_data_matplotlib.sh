#!/bin/sh
echo $1
echo $2
STYX=~/go/bin/styx
TIME_SPAN=$1
OUTPUT_DIR=$2
EX="ex2"
TIME=$(date "+%Y%m%d-%H%M%S")
if [ ! -d $OUTPUT_DIR/$TIME-$EX ]; then
  mkdir -p $OUTPUT_DIR/$TIME-$EX
fi
OUTPUT_DIR=$OUTPUT_DIR/$TIME-$EX
echo $OUTPUT_DIR


#$STYX -d $TIME_SPAN 'bms_business_violation_total' > $OUTPUT_DIR/bms_business_violation_total.py
echo "Start scrach matplotlib from promethus"
$STYX matplotlib -d $TIME_SPAN --prometheus http://manager-01:9090 'docker_swarm_service_target_replicas{service_name=~"\\w+_business_web_1"}'  > $OUTPUT_DIR/scale_business_web_1.py
echo "Step1"
$STYX matplotlib -d $TIME_SPAN --prometheus http://manager-01:9090 'docker_swarm_service_target_replicas{service_name=~"\\w+_business_web_2"}'  > $OUTPUT_DIR/scale_business_web_1.py
echo "Step2"
$STYX matplotlib -d $TIME_SPAN --prometheus http://manager-01:9090 'docker_swarm_service_target_replicas{service_name=~"\\w+_business_web_3"}'  > $OUTPUT_DIR/scale_business_web_1.py
$STYX matplotlib -d $TIME_SPAN --prometheus http://manager-01:9090 'avg(rate(container_cpu_usage_seconds_total[1m])) by (container_label_com_docker_swarm_service_name) * 100'  > $OUTPUT_DIR/cpu_usage.py
echo "Step3"
$STYX matplotlib -d $TIME_SPAN --prometheus http://manager-01:9090 'avg(container_memory_rss) by (container_label_com_docker_swarm_service_name)'  > $OUTPUT_DIR/memory_usage.py
echo "Step4"
$STYX matplotlib -d $TIME_SPAN --prometheus http://manager-01:9090 'avg(rate(container_fs_writes_bytes_total[1m])) by (container_label_com_docker_swarm_service_name)'  > $OUTPUT_DIR/io_write_usage.py
echo "Step5"
echo "Stop scrach matplotlib from promethus"

docker run --rm -ti --net=host taskrabbit/elasticsearch-dump --input=http://localhost:9200/fluentd-*  --output=$ --type=data | gzip > $OUTPUT_DIR/logs.json.gz
