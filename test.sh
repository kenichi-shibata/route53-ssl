#!/usr/bin/env bash

# Fail early
set -eu -o pipefail

# Check if running in CI environment
if [[ ! "${CI:-false}" == "true" ]]; then
  echo "ERROR: Not running in CI environment!"
  exit 1
fi

# create a test here need donor for AWS Route53 testing 
exit 0
