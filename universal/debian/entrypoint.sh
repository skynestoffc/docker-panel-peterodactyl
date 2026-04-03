#!/bin/bash
set -e

cd /home/container || exit 1

TZ=${TZ:-UTC}
export TZ

INTERNAL_IP=$(ip route get 1 2>/dev/null | awk '{print $(NF-2); exit}')
export INTERNAL_IP

STARTUP=${STARTUP:-/bin/bash -li}

printf "\033[1m\033[33m%s@tokoptero~ \033[0m%s\n" "$(whoami)" "$STARTUP"

exec /bin/bash -lc "$STARTUP"
