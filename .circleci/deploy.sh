#!/bin/sh

set -e

# Run from parent directory
cd "$( dirname "$0" )" && cd ..

PRISMA_DATA_ENDPOINT_BASE=https://us1.prisma.sh/adrian-carriger-35d3e6/sl-data

if [[ $CIRCLE_BRANCH == "develop" ]]; then
  echo "PRISMA_SECRET=$PRISMA_SECRET_STAGING" >> /app/.env
  echo "PRISMA_DATA_ENDPOINT=$PRISMA_DATA_ENDPOINT_BASE/staging" >> /app/.env
  up deploy staging
fi

if [[ $CIRCLE_BRANCH == "master" ]]; then
  echo "PRISMA_SECRET=$PRISMA_SECRET_PRODUCTION" >> /app/.env
  echo "PRISMA_DATA_ENDPOINT=$PRISMA_DATA_ENDPOINT_BASE/production" >> /app/.env
  up deploy production
fi
