#!/bin/bash
# ponytail: no hexo-deployer-git — repo root doubles as published output, deployer would wipe hexo-source/
set -e
cd "$(dirname "$0")"

npx hexo generate

rsync -a --delete \
  --exclude '.git' \
  --exclude 'hexo-source' \
  public/ ../

cd ..
git add -A
git commit -m "Site updated: $(date '+%Y-%m-%d %H:%M:%S')"
git push
