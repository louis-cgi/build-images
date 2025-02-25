#!/bin/zsh -
ls-images() {
  echo "\n### Listing Docker Images"
  docker image ls --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"
  sleep 3
}

title() {
  clear
  echo "###"
  echo "### $1"
  echo "###\n"
}


#
#
title "Delete Images"
docker rmi -f app-rust:latest
docker rmi -f app-sb-compressed:latest
docker rmi -f app-sb-uncompressed:latest
docker rmi -f app-sb-jdk:latest
ls-images

#
#
title "Building Java Spring Boot Container with JDK"
cd ..
cd multiply-matrix
git checkout main
./build.sh
ls-images

title "Building Java Spring Boot Native (uncompressed)"
git checkout native-uncompressed
./build.sh
ls-images

title "Building Java Spring Boot Native (compressed)"
git checkout native-compressed
./build.sh
ls-images

#
#
title "Building Rust Compressed"
cd ../multiply-rust
clear
git checkout main
./build.sh
clear
ls-images

