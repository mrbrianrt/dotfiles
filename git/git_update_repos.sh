#!/bin/bash

workspace="workspace"

for dir in $HOME/$workspace/*; do
  echo "Changing dirs to $dir"
  cd $dir
  git fetch --all
  git stash
  branches=$(git branch -a)
  for branch in branches; do
    if [ "$branch" = "master" ] || [ "$branch" = "main" ] || [ "$branch" = "trunk" ]; then
      git checkout $branch
      git pull upstream $branch
      git push origin $branch
      break
    fi
  done
  cd ..
done
