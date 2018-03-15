#!/bin/sh

git tag --delete stable
git push origin :stable
git tag -a stable "$1" -m "Release $1"
git push origin stable

