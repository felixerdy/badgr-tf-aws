resource "aws_db_subnet_group" "rds_subnet_group" {
  subnet_ids = [for subnet in var.subnets : subnet.id]
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.mysql_sg]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.id
}