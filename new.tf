provider "aws" {
region = "ap-south-1"
access_key = "AKIA6CRC6Y4P56SZHKNS"
secret_key = "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"
}

resource "aws_s3_bucket" "b__axiomio_1" {
  bucket = "my-tf-test-bucket-axiom-io-1"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


resource "aws_iam_user" "lb" {
  name = "username1"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb.name
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  policy = <<EOF
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action":[
            "s3:ListBucket"
         ],
         "Resource":"arn:aws:s3:::my-tf-test-bucket-axiom-io-1"
      },
      {
         "Effect":"Allow",
         "Action":[
            "s3:PutObject",
            "s3:GetObject"
         ],
         "Resource":"arn:aws:s3:::my-tf-test-bucket-axiom-io-1/*"
      }
   ]
}
EOF
}