#!/usr/bin/env bash
TF_ACTION=${1:-"plan"}
ENVIRONMENT=poc
[[ $TF_ACTION == 'apply' ]] && auto_approve='-auto-approve' || auto_approve=''
terraform init -reconfigure -upgrade=true -backend=true -backend-config=../tfvars/backends/${ENVIRONMENT}.tfvars
terraform ${TF_ACTION} -var-file=../tfvars/${ENVIRONMENT}.tfvars ${auto_approve}