# RDS SECURITY GROUP

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "RDS Security Group"

  vpc_id = var.vpc_id

  ingress {
    description = "MySQL from Private EC2"

    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"

    security_groups = [
      var.private_sg_id
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

# DB SUBNET GROUP

resource "aws_db_subnet_group" "db_subnet_group" {
  name = "my-db-subnet-group"

  subnet_ids = [
    var.private_subnet_1_id,
    var.private_subnet_2_id
  ]

  tags = {
    Name = "db-subnet-group"
  }
}

# MYSQL RDS

resource "aws_db_instance" "mysql_rds" {
  identifier = "mysql-rds"

  allocated_storage = 20
  storage_type      = "gp3"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  db_name  = "mydb"
  username = var.db_username
  password = var.db_password

  skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  publicly_accessible = false

  tags = {
    Name = "mysql-rds"
  }
}
