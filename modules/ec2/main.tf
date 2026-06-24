resource "aws_key_pair" "mumbai_kp" {
  key_name   = "mumbai-kp"
  public_key = file("~/.ssh/id_rsa.pub")
}

# BASTION SG

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Bastion Host SG"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

# PRIVATE SG

resource "aws_security_group" "private_sg" {
  name        = "private-sg"
  description = "Private EC2 SG"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from Bastion"

    from_port       = 22
    to_port         = 22
    protocol        = "tcp"

    security_groups = [
      aws_security_group.bastion_sg.id
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

# BASTION HOST

resource "aws_instance" "bastion_host" {
  ami                    = "ami-00e801948462f718a"
  instance_type          = "t3.micro"

  subnet_id              = var.public_subnet_id

  vpc_security_group_ids = [
    aws_security_group.bastion_sg.id
  ]

  key_name = aws_key_pair.mumbai_kp.key_name

  tags = {
    Name = "BastionHost"
  }
}

# PRIVATE EC2

resource "aws_instance" "private_ec2" {
  ami                    = "ami-00e801948462f718a"
  instance_type          = "t3.micro"

  subnet_id              = var.private_subnet_id

  vpc_security_group_ids = [
    aws_security_group.private_sg.id
  ]

  key_name = aws_key_pair.mumbai_kp.key_name

  tags = {
    Name = "PrivateEC2"
  }
}
