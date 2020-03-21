#!/bin/bash

workspace=`pwd`

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo

# Go To content folder
cd ${workspace}/docs
# Add changes to git.

# Commit changes.
msg="update website at `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -am "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ${workspace}

echo -e "\033[0;32mstart to sync to blog repo...\033[0m"
git commit -am "update project at `date`"
git push origin master

