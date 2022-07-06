#!/bin/bash

influx setup --host "http://${INFLUXDB_HOST}:8086" -u admin -p ${INFLUXDB_PASSWORD} -t ${INFLUXDB_TOKEN} -o green-bench -b green-bench -r 1d -f
