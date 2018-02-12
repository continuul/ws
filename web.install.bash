#!/usr/bin/env bash

TMPDIR=/tmp/ws.$RANDOM
mkdir $TMPDIR
(
cd $TMPDIR
curl -Lo $TMPDIR/ws.tgz https://github.com/continuul/ws/releases/download/v1.0/ws.tgz
tar xzf ws.tgz
cat install | bash
echo $(date) > $HOME/.ws/when.installed
)
rm -fr $TMPDIR
