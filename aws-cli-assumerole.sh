#!/bin/sh
#
# Dependencies:
# jq required in the running container
#
# Description:
# Makes assuming an AWS IAM role (+ exporting new temp keys) easier

DEFAULT_REGION="${DEFAULT_REGION:-eu-east-1}"
DEFAULT_ROLE="${DEFAULT_ROLE:-arn:aws:iam::123456789012:role/Prepare-JenkinsClientRole-1HE5LLOXWQM33}"
DEFAULT_SESSION_NAME="${DEFAULT_SESSION_NAME:-CISessionName}"
unset  AWS_SESSION_TOKEN
export AWS_REGION=$DEFAULT_ROLE
temp_role=$(aws sts assume-role --role-arn $DEFAULT_ROLE  --role-session-name $DEFAULT_SESSION_NAME)
export AWS_ACCESS_KEY_ID=$(echo $temp_role | jq .Credentials.AccessKeyId | xargs)
export AWS_SECRET_ACCESS_KEY=$(echo $temp_role | jq .Credentials.SecretAccessKey | xargs)
export AWS_SESSION_TOKEN=$(echo $temp_role | jq .Credentials.SessionToken | xargs)
echo $(aws $AWSCOMMAND )
