#!/bin/sh
main() {
  local tag=$1
  local branch="bp_$tag"
  local sb='https://github.com/sandboxie-plus/Sandboxie'

  if [ -z "$tag" ]; then
    echo "input tag"
    return 1
  fi

  git remote add sb $sb
  git fetch --all --tags

  git checkout master
  git reset --hard origin/master
  git clean -df
  git rebase sb/master || return 1
  git push -uf origin master

  git checkout -b $branch tags/$tag
  git checkout $branch
  git reset --hard tags/$tag
  git clean -df
  git cherry-pick origin/master
  git push -uf origin $branch
}

main "$@"