#!/bin/sh

# This script is used to prepare release of a new version of the project.

git submodule update --init --recursive

REPO_NAME=${GITHUB_REPOSITORY##*/}
TAG=$(git describe --tags --abbrev=0)

echo "Preparing release $TAG of $REPO_NAME"

rm -rf $REPO_NAME-$TAG.zip
zip -r $REPO_NAME-$TAG.zip ./ -x "*/.git/*" "*/.github/*" "*/.github-scripts/*" ".gitmodules"

gh release create "$TAG" \
    --repo="$GITHUB_REPOSITORY" \
    --title="${GITHUB_REPOSITORY#*/} ${tag#v}" \
    --generate-notes
