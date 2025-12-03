#!/bin/bash
#

# Single PUT to node 1
python3 ./kvclient.py --nodes 192.168.122.110:8001,192.168.122.239:8002,192.168.122.137:8003,192.168.122.69:8004,192.168.122.148:8005 cmd --node 1  "PUT color blue"


# GET from node 2
python3 ./kvclient.py --nodes 192.168.122.110:8001,192.168.122.239:8002,192.168.122.137:8003,192.168.122.69:8004,192.168.122.148:8005 cmd --node 2   "GET color"
# Race two writers (great for no-mutex demo)
python3 ./kvclient.py --nodes 192.168.122.110:8001,192.168.122.239:8002,192.168.122.137:8003,192.168.122.69:8004,192.168.122.148:8005 race  "PUT color blue" "PUT color red"


# Read the key from ALL nodes after the race
python3 ./kvclient.py --nodes 192.168.122.110:8001,192.168.122.239:8002,192.168.122.137:8003,192.168.122.69:8004,192.168.122.148:8005  getall color

