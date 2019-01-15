#!/bin/sh

UPSTREAM_URL="https://codeload.github.com/vscreen/spec/zip/master"
OUT_DIR="lib/generated"

cd `dirname $0`

curl -o /tmp/spec.zip -L ${UPSTREAM_URL}
unzip -d /tmp /tmp/spec.zip
mv /tmp/spec-master/dart/* ${OUT_DIR}/