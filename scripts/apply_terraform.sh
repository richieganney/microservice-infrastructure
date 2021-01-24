#!/bin/bash

# Run this script to apply the cloud resrouces

set -ex

terraform init
terraform apply --auto-approve