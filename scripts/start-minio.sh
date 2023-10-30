#!/usr/bin/env bash
set -eu -o pipefail
source ./scripts/prepare-env.sh

docker run -td \
  --name "${CONTAINER_PREFIX}-minio" \
  -p 9000:9000 \
  -p 9001:9001 \
    minio/minio \
      server /data \
        --console-address ':9001'
