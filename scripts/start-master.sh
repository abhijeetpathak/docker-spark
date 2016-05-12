#!/usr/bin/env bash

HOSTNAME=`hostname`
export HOST_IP=`getent hosts $HOSTNAME | cut -d' ' -f1`

export SPARK_MASTER_IP=$HOST_IP
export SPARK_LOCAL_IP=$HOST_IP
/usr/local/spark/sbin/start-master.sh --properties-file /spark-defaults.conf -i $SPARK_LOCAL_IP "$@"
/bin/bash
