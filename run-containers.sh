#!/bin/sh -
clear

echo "Spring Boot Container with JDK"
time -p docker run --rm app-sb-jdk | grep completed

echo "\nSpring Boot Container Native Uncompressed"
time -p docker run --rm app-sb-uncompressed | grep completed

echo "\nSpring Boot Container Native UPX Compressed"
time -p docker run --rm app-sb-compressed | grep completed

echo "\nRust Container UPX Compressed"
time -p docker run --rm app-rust | grep completed

