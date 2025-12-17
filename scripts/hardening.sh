#!/usr/bin/env bash

# --Configuration variables --

NEW_USERNAME="sysadmin"
USER_HOME="/home/${NEW_USERNAME}"

# -- Environment variables setup
# -- Password variables 
USER_PASSWORD_ENV="OPNSENSE_USER_PASS"
USER_PASSWORD=$(printenv ${USER_PASSWORD_ENV})

# pub key variable 
PUBKEY_ENV="OPNSENSE_SSH_PUBKEY"
NEW_SSH_PUBLIC_KEY=$(printenv ${PUBKEY_ENV})



