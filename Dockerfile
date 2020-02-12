FROM alpine:latest

LABEL "com.github.actions.name"="Rsync Deploy"

LABEL maintainer="benjamin@bckr.me"

RUN apk add --no-cache git rsync bash openssh

RUN mkdir -p "/root/.ssh" && chmod 700 "/root/.ssh"

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
