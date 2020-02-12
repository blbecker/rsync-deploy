#!/bin/bash

set -e

mkdir -p /root/.ssh

echo "${INPUT_DEPLOYMENT_KEY}" | base64 -d >> "/root/.ssh/id_rsa" && \
    chmod 0700 "/root/.ssh" && \
    chmod 0600 "/root/.ssh/id_rsa"

rsync -e 'ssh -i /root/.ssh/id_rsa -o StrictHostKeyChecking=no' -avzhP "${INPUT_SOURCE_DIR}" "${INPUT_DEPLOYMENT_USER}"@"${INPUT_DESTINATION_HOST}":"${INPUT_DESTINATION_PATH}"
