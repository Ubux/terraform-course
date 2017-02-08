[
  {
    "essential": true,
    "memory": 256,
    "name": "myapp",
    "cpu": 256,
    "environment": [{
      "name": "NODE_ENV",
      "value": "production"
    },{
      "name": "PR_AM_PORT",
      "value": "9001"
    },{
      "name": "DB_HOST",
      "value": "${ACCOUNT_DB_HOST}"
    },{
      "name": "DB_NAME",
      "value": "${ACCOUNT_DB_NAME}"
    },{
      "name": "DB_USER",
      "value": "${ACCOUNT_DB_USER}"
    },{
      "name": "DB_PASSWORD",
      "value": "${ACCOUNT_DB_PASSWORD}"
    },{
      "name": "REDIS_HOST",
      "value": "${ACCOUNT_REDIS_HOST}"
    }],
    "image": "${REPOSITORY_URL}:${APP_VERSION}",
    "workingDirectory": "/app",
    "command": ["npm", "start"],
    "portMappings": [
        {
            "containerPort": 9001,
            "hostPort": 9001
        }
    ]
  }
]
