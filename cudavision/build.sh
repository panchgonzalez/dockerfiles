#!/bin/bash

arg_dockerfile="Dockerfile.base"
arg_imagename=cudavision-base
arg_cudaversion=11.1
arg_help=0
arg_no_cache=""

while [[ "$#" -gt 0 ]]; do case $1 in
  --file) arg_dockerfile="$2"; shift;;
  --tag) arg_imagename="$2"; shift;;
  --cuda) arg_cudaversion="$2"; shift;;
  --no-cache) arg_no_cache="--no-cache"; shift;;
  -h|--help) arg_help=1;;
  *) echo "Unknown parameter passed: $1"; echo "For help type: $0 --help"; exit 1;
esac; shift; done

if [ "$arg_help" -eq "1" ]; then
    echo "Usage: $0 [options]"
    echo " --help or -h         : Print this help menu."
    echo " --file  <dockerfile> : Docker file to use for build."
    echo " --tag   <imagename>  : Image name for the generated container."
    echo " --cuda  <version>    : CUDA version to use."
    exit;
fi

docker_args="\
  $arg_no_cache
  -f $arg_dockerfile \
  --build-arg CUDA_VERSION=$arg_cudaversion \
  --build-arg uid=$(id -u) \
  --build-arg gid=$(id -g) \
  --tag=$arg_imagename ."

echo "Building container"
echo "> docker build $docker_args"
docker build $docker_args
