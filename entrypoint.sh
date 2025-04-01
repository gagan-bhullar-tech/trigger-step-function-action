#!/bin/bash -l

set -eo pipefail

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
  echo "error: AWS_ACCESS_KEY_ID is not set"
  err=1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "error: AWS_SECRET_ACCESS_KEY is not set"
  err=1
fi

if [ -z "$AWS_REGION" ]; then
  echo "error: AWS_REGION is not set"
  err=1
fi

if [ $err -eq 1 ]; then
  exit 1
fi

if [ -z "$STATE_MACHINE_ARN" ]; then
  echo "error: STATE_MACHINE_ARN is not set"
  err=1
fi

aws stepfunctions start-execution \
  --state-machine-arn "$STATE_MACHINE_ARN" \
  --region "$AWS_REGION"