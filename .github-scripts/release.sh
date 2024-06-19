#!/bin/sh

# This script is used to prepare release of a new version of the project.

git submodule update --init --recursive

REPO_NAME=$(git remote show origin | grep "Fetch URL:" | sed "s/.*\/\([^ ]*\)\.git/\1/")
TAG=$(git describe --tags --abbrev=0)

echo "Preparing release $TAG of $REPO_NAME"

#rm -rf $REPO_NAME-$TAG.zip
#zip -r $REPO_NAME-$TAG.zip ./ -x "*/.git/*" "*/.github/*" "*/.github-scripts/*" ".gitmodules"
