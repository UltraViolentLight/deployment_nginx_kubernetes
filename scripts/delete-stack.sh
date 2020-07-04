#!/bin/bash

# script to delete a cloud formation config
aws cloudformation delete-stack \
    --stack-name $1 \
    --region=us-west-2
