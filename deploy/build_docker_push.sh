#!/bin/bash
uname=$1
passwd=$2
version=$3
echo {passwd} | docker login --username=${uname} --password-stdin
docker build -t object-storage-proxy:${version} -f Dockerfile  .
docker tag object-storage-proxy:${version} ${uname}/object-storage-proxy:${version}
docker push ${uname}/object-storage-proxy:${version}
if [ $? -eq 0 ]; then
 echo "push success"
else
 echo "push failed"
fi
