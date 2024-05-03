#!/bin/bash
set -e

# Stop the running container (if any)
echo "Hi"
fuser -n tcp -k 5000

