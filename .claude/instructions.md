# Personal Claude Instructions

## AWS Resource Queries

When I ask about AWS resources (Lambda functions, DynamoDB tables, S3 buckets, CloudWatch logs, etc.), use AWS CLI commands to fetch the information directly instead of asking me to check the AWS console.

### Common Commands
- **List Lambda functions**: `aws lambda list-functions --query 'Functions[].FunctionName' --output table`
- **Get Lambda details**: `aws lambda get-function --function-name <name>`
- **Lambda logs**: `aws logs tail /aws/lambda/<function-name> --since 1h`
- **List DynamoDB tables**: `aws dynamodb list-tables`
- **Describe DynamoDB table**: `aws dynamodb describe-table --table-name <name>`
- **Scan DynamoDB**: `aws dynamodb scan --table-name <name> --limit 5`
- **List S3 buckets**: `aws s3 ls`
- **S3 objects**: `aws s3 ls s3://<bucket>/ --recursive --summarize`
- **EC2 instances**: `aws ec2 describe-instances --query 'Reservations[].Instances[].[InstanceId,State.Name,Tags[?Key==\`Name\`].Value|[0]]' --output table`
- **SQS queues**: `aws sqs list-queues`
- **SQS messages**: `aws sqs get-queue-attributes --queue-url <url> --attribute-names ApproximateNumberOfMessages`
- **SNS topics**: `aws sns list-topics`
- **Secrets Manager**: `aws secretsmanager list-secrets --query 'SecretList[].Name'`
- **Get secret value**: `aws secretsmanager get-secret-value --secret-id <name> --query SecretString --output text`
- **Parameter Store**: `aws ssm get-parameters-by-path --path /<env>/ --recursive`
- **Step Functions**: `aws stepfunctions list-state-machines --query 'stateMachines[].name'`
- **CloudWatch alarms**: `aws cloudwatch describe-alarms --state-value ALARM`
- **ECS services**: `aws ecs list-services --cluster <cluster>`
- **API Gateway**: `aws apigateway get-rest-apis --query 'items[].name'`

### Workflow
1. When I ask about AWS resources, run the appropriate CLI command
2. Parse and summarize the output in a readable format
3. If SSO session expired, remind me to run `aws sso login`
4. Ask which environment (dev/prod/eng) if ambiguous

---

## Development Commands (MX2/docr)

### Pants Build System
- **Run tests**: `pants test <path>::` or `pants test <file>:tests`
- **Single test**: `pants test <path> -- -xvs -k <test_name>`
- **Type check**: `pants check <path>::`
- **Lint**: `pants lint <path>::`
- **Format**: `pants fmt <path>::`
- **Run code**: `pants run <target>`
- **Coverage**: `pants test --use-coverage <path>::`
- **List targets**: `pants list <path>::`

### Git/GitHub
- **PR status**: `gh pr status`
- **Create PR**: `gh pr create --fill`
- **View PR**: `gh pr view`
- **Check CI**: `gh run list --limit 5`
- **PR diff**: `gh pr diff`
- **Checkout PR**: `gh pr checkout <number>`

### Issue Tracking (bd/beads)
- **Find work**: `bd ready`
- **Show issue**: `bd show <id>`
- **Claim issue**: `bd update <id> --status in_progress`
- **Close issue**: `bd close <id>`
- **Sync**: `bd sync`

### Terraform/Terragrunt
- **Plan**: `terragrunt plan`
- **Apply**: `terragrunt apply`
- **State list**: `terragrunt state list`
- **Show resource**: `terragrunt state show <resource>`

---

## Shortcuts

When I say:
- "deploy logs" → show recent CloudWatch logs for the Lambda I'm working on
- "check ci" → run `gh run list` and show status
- "run tests" → run pants test on the current directory
- "what's broken" → run `pants check` and `pants lint` on current path
- "db tables" → list DynamoDB tables in current environment
- "my prs" → show my open pull requests
- "errors" → check CloudWatch for recent errors in relevant services

---

## Preferences

- Always show commands you're running so I can learn
- Summarize large outputs instead of dumping raw JSON
- Suggest follow-up commands when relevant
- Default to dev environment unless I specify otherwise
