#!/usr/bin/env bash

./build.sh
timestamp=$(date "+%Y%m%d%H%M%S")
tar czf "dist/release-${timestamp}.tgz" index.html css/ js/ 