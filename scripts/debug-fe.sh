#!/usr/bin/env bash
set -eu -o pipefail

(cd data/ && python3 -m http.server &)
(cd project_39_fe/ && flutter run -d chrome --web-browser-flag '--disable-web-security')
