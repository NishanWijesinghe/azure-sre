#!/usr/bin/env bash
# Azure bug on command:
# https://github.com/Azure/azure-cli/issues/9867#issuecomment-614759351

#az consumption budget create --amount 15 \
#                             --budget-name monthly_account \
#                             --category cost \
#                             --end-date '2025-01-01' \
#                             --start-date '2019-01-01' \
#                             --time-grain monthly