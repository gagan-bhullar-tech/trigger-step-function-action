# Trigger AWS Step Function action

A GitHub Workflow Action for triggering AWS step function

## Usage

```yaml
- name: Trigger Step Function
  uses: chetan/invalidate-cloudfront-action@v2
  env:
    STATE_MACHINE_ARN: ${{ secrets.STATE_MACHINE_ARN }}
    AWS_REGION: "us-west-1"
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

## Configuration

| Param                 | Required? | Description                                                                                        |
| --------------------- | --------- | -------------------------------------------------------------------------------------------------- |
| STATE_MACHINE_ARN     | yes       | A state machine ARN which user wants to trigger                                          |
| AWS_REGION            | yes       | AWS Region to operate in                                                                           |
| AWS_ACCESS_KEY_ID     | yes       | Access key with necessary permissions to invoke step functions |
| AWS_SECRET_ACCESS_KEY | yes       | Secret key                                                                                         |

### AWS IAM Policy

In order to use this action, you will need to supply credentials which have, at minimum, the following permission:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "states:StartExecution",
            "Resource": "arn:aws:states::<account id>:execution:<step function name>:<step function ID>"
        }
    ]
}
```