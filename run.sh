#!/bin/sh
#
# Use this script to run your program LOCALLY.

set -e # Exit early if any commands fail

(
  cd "$(dirname "$0")" # Ensure compile steps are run within the repository directory
  zig build
)

exec zig-out/bin/http-server "$@"
