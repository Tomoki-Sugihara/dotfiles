#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: cds <project_name>"
  return 1
fi

repo_name=$1
work_dir=~/dev/
github_repo_user=Tomoki-Sugihara

cd $work_dir
mkdir "$repo_name"
cd "$repo_name"

# README.mdの作成
echo "# $repo_name" > README.md

# github repositoryの作成
gh repo create $repo_name --private

# gitのsetup
git init
git remote add origin git@github.com:$github_repo_user/$repo_name.git

git add README.md
git commit -m "Initial commit"

# pushするか確認
read -p "Do you want to push to github? (y/n): " push_to_github
if [ "$push_to_github" = "y" ]; then
  git push -u origin main
fi

# cursorのsetup
if [ "$2" = "-r" ]; then
  cursor -r .
else
  cursor .
fi