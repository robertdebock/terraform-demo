# Terraform demo

A demo to show Terraform.

This repository has a few branches to step through a couple of stages.

|#|branch name|explanation    |
|-|-----------|---------------|
|1|master     |Single node.   |
|2|two        |Multiple nodes.|
|3|three      |Provisioning.  |

## Add credentials

Before you can order resources at digital ocean, please place your personal file:

terraform.tfvars
```
do_token = "A-long-hexadeciamal-string-that-you-need-to-generate-at-digitalocean"
```

## Initial setup

Before using this code, please initialize terraform.

```
terraform init
```

## Plan

To see what Terraform would do, run `plan`.

```
terraform plan
```

## Apply

Once you are happy with what Terraform want to change, run `apply`.

```
terraform apply
```

## Destroy

Clean up the resources Terraform created.

```
terraform destroy
```
