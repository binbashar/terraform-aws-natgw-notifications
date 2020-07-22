<div align="center">
    <img src="https://raw.githubusercontent.com/binbashar/terraform-aws-natgw-notifications/master/figures/binbash.png" alt="binbash" width="250"/>
</div>
<div align="right">
  <img src="https://raw.githubusercontent.com/binbashar/terraform-aws-natgw-notifications/master/figures/binbash-leverage-terraform.png"
  alt="leverage" width="130"/>
</div>

# Terraform Module: AWS VPC Nat Gateway notifications

## Overview

CloudWatch Alarm that enables notifications to an SNS topic when VPC Nat Gateway has 0 active connections for more than 60 mins.

Creates the following resources:

* CloudWatch metric to send notifications via pre-existing SNS when the total number of concurrent
active TCP connections through the NAT gateway is zero, which indicates that there are no active
connections through the NAT gateway.
* Statistics: The most useful statistic is Max.

## Examples

### VPC Nat Gateway active cx zero notification

```hcl

module "natgw-notifications" {
  source  = "binbashar/natgw-notifications/aws"
  version = "0.0.1"

  sns_topic_name = "slack-events"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| sns\_topic\_name | The name of the SNS topic to send root login notifications. | string | n/a | yes |
| alarm\_suffix | Suffix to add to alarm name, used for separating different AWS account. | string | `""` | no |
| send\_sns | If true will send message *Successful AWS console login with the root account* to SNS topic | bool | `"false"` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## TODO
* Add examples dir + associated terratests

---

## Release Management
### CircleCi PR auto-release job

<div align="left">
  <img src="https://raw.githubusercontent.com/binbashar/terraform-aws-natgw-notifications/master/figures/circleci.png" alt="circleci" width="130"/>
</div>

- [**pipeline-job**](https://circleci.com/gh/binbashar/terraform-aws-natgw-notifications) (**NOTE:** Will only run after merged PR)
- [**releases**](https://github.com/binbashar/terraform-aws-natgw-notifications/releases)
- [**changelog**](https://github.com/binbashar/terraform-aws-natgw-notifications/blob/master/CHANGELOG.md)
