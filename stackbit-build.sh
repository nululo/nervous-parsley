#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e8b941d7d53460014134d51/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e8b941d7d53460014134d51
curl -s -X POST https://api.stackbit.com/project/5e8b941d7d53460014134d51/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e8b941d7d53460014134d51/webhook/build/publish > /dev/null
