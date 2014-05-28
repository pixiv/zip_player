#!/bin/bash

cd $(dirname "$0")

echo "Setting up test HTTP server..."

NODE_PATH=/usr/lib/node_modules/ node server.js &

PID=$!
trap "kill -TERM $PID; kill -KILL $PID; exit 1" SIGHUP SIGINT SIGTERM

echo "Running tests...."

mocha-phantomjs -p /usr/bin/phantomjs http://localhost:12321/test/test.html
RET=$?

echo "Done! Cleaning up..."

kill -TERM $PID
kill -KILL $PID

exit $RET