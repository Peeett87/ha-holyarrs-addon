#!/bin/sh
set -eu

CONFIG_DIR="/config"
KEY_FILE="${CONFIG_DIR}/themerr-tokens.key"

mkdir -p "${CONFIG_DIR}"

# Themerr requires a persistent encryption key outside its application database.
# Keep this file in the add-on's persistent config mount across container updates.
if [ ! -s "${KEY_FILE}" ]; then
    umask 077
    head -c 32 /dev/urandom | base64 | tr '+/' '-_' | tr -d '=\n' > "${KEY_FILE}"
    chmod 600 "${KEY_FILE}"
fi

export THEMERR_TOKEN_KEY_FILE="${KEY_FILE}"
export TZ="${TZ:-Europe/Amsterdam}"

exec themerr
