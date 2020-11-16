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

module "vpc-natgw-notifications" {
  source = "github.com/binbashar/terraform-aws-natgw-notifications.git?ref=v0.0.1"

  alarm_suffix   = "${var.environment}-account"
  send_sns       = true
  sns_topic_name = data.terraform_remote_state.notifications.outputs.sns_topic_name_bb_monitoring
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_evaluation\_periods | The number of periods over which data is compared to the specified threshold. | `number` | `1` | no |
| alarm\_period | The period in seconds over which the specified statistic is applied, eg 3600 sec = 60 mins. | `number` | `3600` | no |
| alarm\_suffix | Suffix to add to alarm name, used for separating different AWS account. | `string` | `""` | no |
| send\_sns | If true will send message *Successful AWS console login with the root account* to SNS topic. | `bool` | `false` | no |
| sns\_topic\_name | The name of the SNS topic to send root login notifications. | `string` | n/a | yes |

## Outputs

No output.

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
