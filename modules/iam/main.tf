########################################
# EC2 Assume Role Policy
########################################

data "aws_iam_policy_document" "assume_role" {

  statement {

    effect = "Allow"

    principals {

      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]

    }

    actions = [
      "sts:AssumeRole"
    ]

  }

}

########################################
# IAM Role
########################################

resource "aws_iam_role" "this" {

  name = var.role_name

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(
    var.tags,
    {
      Name = var.role_name
    }
  )

}

########################################
# IAM Policy Document
########################################

data "aws_iam_policy_document" "ebs_snapshot" {

  statement {

    effect = "Allow"

    actions = [

      "ec2:DescribeInstances",
      "ec2:DescribeVolumes",
      "ec2:DescribeSnapshots",
      "ec2:CreateSnapshot",
      "ec2:CreateTags"

    ]

    resources = ["*"]

  }

}

########################################
# IAM Policy
########################################

resource "aws_iam_policy" "this" {

  name = var.policy_name

  policy = data.aws_iam_policy_document.ebs_snapshot.json

  tags = merge(
    var.tags,
    {
      Name = var.policy_name
    }
  )

}

########################################
# IAM Role Policy Attachment
########################################

resource "aws_iam_role_policy_attachment" "this" {

  role       = aws_iam_role.this.name

  policy_arn = aws_iam_policy.this.arn

}

########################################
# IAM Instance Profile
########################################

resource "aws_iam_instance_profile" "this" {

  name = var.instance_profile_name

  role = aws_iam_role.this.name

  tags = merge(
    var.tags,
    {
      Name = var.instance_profile_name
    }
  )

}