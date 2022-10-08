#!/bin/bash

docker exec -it node01 /bin/bash -c 'sshpass -p root ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostkeyChecking=no  node01'
docker exec -it node01 /bin/bash -c 'sshpass -p root ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostkeyChecking=no  node02'
docker exec -it node01 /bin/bash -c 'sshpass -p root ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostkeyChecking=no  node03'
docker exec -it node01 /bin/bash -c 'sshpass -p root ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostkeyChecking=no  0.0.0.0'
docker exec -it node01 /bin/bash -c 'rm -rf /usr/local/hadoop-data/tmp'
docker exec -it node02 /bin/bash -c 'rm -rf /usr/local/hadoop-data/tmp'
docker exec -it node03 /bin/bash -c 'rm -rf /usr/local/hadoop-data/tmp'
docker exec -it node01 /bin/bash -c 'hdfs namenode -format'
docker exec -it node01 /bin/bash -c 'start-dfs.sh'
docker exec -it node01 /bin/bash -c 'start-yarn.sh'
docker exec -it node03 /bin/bash -c 'schematool -dbType mysql -initSchema'
docker exec -it node03 /bin/bash -c 'hive --service metastore'
