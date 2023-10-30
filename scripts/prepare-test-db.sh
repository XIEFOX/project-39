#!/usr/bin/env bash
set -eu -o pipefail

DB_PATH='./data/db/test_db.db'

rm -rf $DB_PATH
mkdir -p ./data/db/ && touch $DB_PATH
sqlite3 $DB_PATH < ./scripts/sql/init.sql
