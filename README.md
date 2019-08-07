# docker-ubuntu-firefox-nvm
Docker image containing firefox and [nvm](https://github.com/nvm-sh/nvm) based on ubuntu:latest. This could be used to run ui-tests on firefox with [testcafe](https://github.com/DevExpress/testcafe) in a ci-pipeline.

ATTENTION: node is not installed, you need to install the desired version yourself!

# Usage example for Concourse-CI
Replace ```[YOUR_REPOSITORY]```:
```
---
platform: linux

image_resource:
  type: docker-image
  source:
    repository: emanuelschmoczer/ubuntu-firefox-nvm

inputs:
  - name: [YOUR_REPOSITORY]

run:
  path: [YOUR_REPOSITORY]/path/to/ui-tests.sh
```

At the beginning of your ui-tests you have to install node, e.g. the lts-version:
```bash
#!/usr/bin/env bash
set -e

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm --version
nvm install --lts
# install yarn or whatever you need to run the tests
npm install -g yarn
# start your application, run your tests, etc.
...
```

