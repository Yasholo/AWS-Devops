#!/bin/bash
set -e

# Stop the running container (if any)
fuser -n tcp -k 5000

echo "Hi"

