#!/usr/bin/env bash
set -eu -o pipefail
source ./scripts/prepare-env.sh

docker rm -f "${CONTAINER_PREFIX}-redis"

docker run -td \
  --name "${CONTAINER_PREFIX}-redis" \
  -p 6379:6379 \
  -v "$PWD/data/redis/data":/data \
    redis
