#!/bin/bash

IMAGE=action-notify

GIT_COMMITTER_USERNAME="user"
GIT_COMMITTER_MESSAGE_ESCAPED="a message"
LINE_CHANNEL_ACCESS_TOKEN=$(jq -r .LINE_CHANNEL_ACCESS_TOKEN ./.config/secret.json)
LINE_TO=$(jq -r .LINE_TO ./.config/secret.json)

docker build -t $IMAGE .

docker run --rm \
	-e GIT_COMMITTER_USERNAME="${GIT_COMMITTER_USERNAME}" \
	-e GIT_COMMIT_MESSAGE_ESCAPED="${GIT_COMMITTER_MESSAGE_ESCAPED}" \
	-e LINE_CHANNEL_ACCESS_TOKEN="${LINE_CHANNEL_ACCESS_TOKEN}" \
	-e LINE_TO="${LINE_TO}" \
	-e TEMPLATE="debug" \
	$IMAGE
