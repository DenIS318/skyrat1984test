#!/bin/sh
set -e
cd "$(dirname "$0")"
exec ../build_rust_1984.sh "$@" # SS1984 ADDITION
exec ../bootstrap/javascript.sh build.ts "$@"
