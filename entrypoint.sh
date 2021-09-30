#!/bin/bash
set -e

rm -f /pai-movie-log/tmp/pids/server.pid

exec "$@"