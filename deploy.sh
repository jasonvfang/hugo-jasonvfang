#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace by `hugo -t <yourtheme>`

if [ -e blog_update ];then
	echo "Update blog"
else
	rm -rf blog_update
	git clone https://github.com/jasonvfang/jasonvfang.github.io.git blog_update
fi

# Go To Public folder
cp public/* blog_update -rf

cd blog_update

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..


