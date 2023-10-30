#!/usr/bin/env bash
set -eu -o pipefail

./scripts/prepare-test-db.sh
./scripts/start-redis.sh
./scripts/start-minio.sh
(cd project-39-be/ && RUST_LOG=info cargo run &)
./scripts/debug-fe.sh

pkill -P $$
