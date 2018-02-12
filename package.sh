#!/usr/bin/env bash

rm -fr target
mkdir target
cp -r scripts target
chmod 0755 target/scripts/bin/ws
mv target/scripts target/ws
(
    cd target
    tar czvf ws.tgz ws
)
