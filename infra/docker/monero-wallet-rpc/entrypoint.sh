#!/bin/bash

/monero/monero-wallet-rpc --non-interactive --rpc-bind-ip=0.0.0.0 --confirm-external-bind "$@"
