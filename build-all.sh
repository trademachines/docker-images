#!/usr/bin/env bash

set -ev

function build_push {
  if [ -f "$2/Dockerfile" ]; then
    echo "Building ${1} in directory ${2}"
    docker build -t "$1" "$2"
    docker push "$1"
  fi
}

for dir in $(ls -d */); do
  name=trademachines/${dir%%/}

  # build latest image
  build_push "${name}" "${dir}"

  # build specific tags
  if ls -d ${dir}*/ 1> /dev/null 2>&1; then
    for tag in $(ls -d ${dir}*/); do
      version="$name:$(echo ${tag%%/} | cut -d '/' -f 2)"
      build_push "${version}" "${tag}"
    done
  fi
done
