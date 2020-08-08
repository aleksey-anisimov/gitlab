#!/bin/sh
# Get the registration token from:
# http://localhost:8080/$user/$project/-/settings/ci_cdsettings/ci_cd -> Runners -> Expand

registration_token=xxxxxxxxxxxxxxxxxxxxx

docker exec -it gitlab-runner \
  gitlab-runner register \
    --non-interactive \
    --registration-token ${registration_token} \
    --locked=false \
    --description docker-stable \
    --url http://gitlab \
    --executor docker \
    --docker-image docker:stable \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
    --docker-network-mode gitlab-network
