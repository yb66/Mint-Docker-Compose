#!/bin/sh
set -e

PROJECT_NAME=${PROJECT_NAME:-"The Mint with no name"}

if ! ls -1A "/${PROJECT_NAME}" | grep -q .; then
	mint init "/${PROJECT_NAME:-workspace}"
fi

exec "$@"
