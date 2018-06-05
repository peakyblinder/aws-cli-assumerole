# AWS CLI in Docker

Containerized AWS CLI on alpine to avoid requiring the AWS CLI to be installed on CI machines.

Automated build on Docker Hub

[![DockerHub Badge](https://hub.docker.com/v2/users/sunilpp/avatar/)](https://hub.docker.com/r/sunilpp/aws-cli-assumerole/)

## Usage

Configure:
 Parameters which needs to be passed as ENV variables to docker run command.

```

AWSCOMMAND <AWS CLI command to run after assuming the role ex: >
DEFAULT_REGION < AWS region,defaut is us-east-1>
DEFAULT_ROLE < IAM role  ARN >
DEFAULT_SESSION_NAME=< Session name, Some String Value>
```

ex:


```
docker run -e AWSCOMMAND='ecs list-task-definitions --region us-east-1'  DEFAULT_ROLE='arn:aws:iam::287840753424:role/Prepare-ciClientRole-1WD0MYXTVQM53' sunilpp/aws-cli-assumerole

```

## Maintenance 


## References

AWS CLI Docs: https://aws.amazon.com/documentation/cli/


# License

