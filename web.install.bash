#!/usr/bin/env bash

: ${TAG:="stable"}

TMPDIR=/tmp/ws.$RANDOM
mkdir $TMPDIR
(
  cd $TMPDIR
  curl -Lo $TMPDIR/ws.tgz https://github.com/continuul/ws/releases/download/$TAG/ws.tgz
  tar xzf ws.tgz
  cat install | bash
)
rm -fr $TMPDIR
