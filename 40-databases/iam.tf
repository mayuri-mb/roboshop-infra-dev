#Create IAM role
resource "aws_iam_role" "mysql" {
    name = local.mysql_role_name #Roboshop-Dev-Mysql

    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    {
        Name = local.mysql_role_name
    },    
    local.common_tags
  )    
}

#Create the policy
resource "aws_iam_policy" "mysql" {
    name = local.mysql_policy_name
    policy = templatefile("mysql_iam_policy.json",{
        environment = var.environment
    }
    )
}

#Attach policy to the role
resource "aws_iam_role_policy_attachment" "mysql" {
    role = aws_iam_role.mysql.name
    policy_arn = aws_iam_policy.mysql.arn
}

#create instance profile
resource "aws_iam_instance_profile" "mysql" {
    name = "${var.project}-${var.environment}-mysql"
    role = aws_iam_role.mysql.name
}
