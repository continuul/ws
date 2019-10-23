#!/usr/bin/env bash

set -o errexit
set -o pipefail

: ${VERSION:?"Specify <major.minor> version for release, e.g 1.2"}

GIT_TAG=v${VERSION}

sed -i "" "s/VERSION=.*/VERSION=\"${VERSION}\"/g" pkg/bin/ws
git add -u
git commit -m "Release ${VERSION}"
git push

git tag -a $GIT_TAG -m "Release of version $GIT_TAG"
git push origin $GIT_TAG

git tag --delete stable
git push origin :stable
git tag -a stable "$GIT_TAG" -m "Release stable @ $GIT_TAG"
git push origin stable
