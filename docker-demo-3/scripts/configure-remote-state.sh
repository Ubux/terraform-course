#!/bin/sh
terraform remote config -backend=s3 -backend-config="bucket=terraform-pr-ubux-state-test" -backend-config="key=terraform/terraform.tfstate" -backend-config="region=us-east-1"
