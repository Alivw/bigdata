#!/bin/bash
docker exec -it node01 /bin/bash -c 'stop-dfs.sh'
docker exec -it node01 /bin/bash -c 'stop-yarn.sh'
