#!/bin/sh

set -e

# Get secrets from files
# Insecure, but there's not much I can do about it
# It's duplicity's fault!
export PASSPHRASE=$(cat "${DUPLICITY_PASSPHRASE_FILE}")

echo "Launched in backup mode, performing backup..." >> /dev/stderr
duplicity \
  --allow-source-mismatch \
  --full-if-older-than "${DUPLICITY_FULL_IF_OLDER_THAN}" \
  /mnt \
  "${DUPLICITY_TARGET_URL}"
