#!/usr/bin/env bash

set -ev

for dir in $(ls -d */); do
  name=trademachines/${dir%%/}
  docker build -t "$name" ${dir}
  docker push "$name"
done
