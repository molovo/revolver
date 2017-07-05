#!/usr/bin/env zsh

function update_homebrew() {
  local version="$1"
  local url="https://github.com/molovo/revolver/archive/$version.tar.gz"
  local -a sumcmds; sumcmds=(sha256sum gsha256sum)
  local sumcmd

  if [[ -z $GH_TOKEN ]]; then
    echo '\033[0;31mGithub repo token not found\033[0;m'
    exit 1
  fi

  if [[ -z $version ]]; then
    echo '\033[0;31mMust supply a version\033[0;m'
    exit 1
  fi

  git clone https://${GH_TOKEN}@github.com/molovo/homebrew-revolver.git deployment >/dev/null 2>&1

  for cmd in $sumcmds; do
    if type -p $cmd >/dev/null 2>&1; then
      sumcmd=$cmd
      break
    fi
  done

  if [[ -z $sumcmd ]]; then
    echo '\033[0;31mUnable to find sha256sum\033[0;m'
    exit 1
  fi

  wget $url
  local -a sumparts; sumparts=($($sumcmd $version.tar.gz))
  local sum=${sumparts[1]}
  local oldIFS=$IFS
  IFS=$'\n'
  local -a formula; formula=($(cat ./deployment/Formula/revolver.rb))
  for line in "${(@f)formula}"; do
    if [[ "$line" =~ '^([ ]+)?url \".*\"' ]]; then
      echo "  url \"$url\"" >> tmpfile
      continue
    fi

    if [[ "$line" =~ '^([ ]+)?sha256 \".*\"' ]]; then
      echo "  sha256 \"$sum\"" >> tmpfile
      continue
    fi

    echo $line >> tmpfile
  done
  IFS=$oldIFS


  mv tmpfile deployment/Formula/revolver.rb

  cd deployment
  git config user.email 'hi@molovo.co'
  git config user.name 'James Dinsdale'

  git add ./Formula/revolver.rb
  git commit -m "Update homebrew formula for version $version"
  git push --quiet origin master >/dev/null 2>&1
}

update_homebrew "$@"
