#!/bin/bash
docker exec -it node01 /bin/bash -c 'stop-dfs.sh'
docker exec -it node01 /bin/bash -c 'rm -rf /usr/local/hadoop/tmp'
docker exec -it node02 /bin/bash -c 'rm -rf /usr/local/hadoop/tmp'
docker exec -it node03 /bin/bash -c 'rm -rf /usr/local/hadoop/tmp'
docker exec -it node01 /bin/bash -c 'hdfs namenode -format'
docker exec -it node01 /bin/bash -c 'start-dfs.sh'
docker exec -it node01 /bin/bash
