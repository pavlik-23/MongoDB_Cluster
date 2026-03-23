#!/bin/bash

echo "Checking MongoDB Replica Set status..."

docker exec mongo1 mongosh --eval "rs.status()"

echo "Checking primary node..."

docker exec mongo1 mongosh --eval "db.isMaster()"
