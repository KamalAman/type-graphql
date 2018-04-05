#!/bin/bash -e

if [ "$TRAVIS_PULL_REQUEST" = "false" ] && [ "$TRAVIS_BRANCH" = "master" ]; then
  git config user.email "$GIT_USER@users.noreply.github.com"
  git config user.name "Travis"
  echo "machine github.com login $GIT_USER password $GIT_TOKEN" > ~/.netrc

  cd website
  npm install
  GIT_USER=$GIT_USER CURRENT_BRANCH=master npm run publish-gh-pages
  exit 0;
fi
