resource "aws_db_instance" "primary" {
  identifier              = "my-primary-db"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = "admin"
  password                = "yourpassword123"
  db_name                 = "mydatabase"
  skip_final_snapshot     = true
  publicly_accessible     = true
  backup_retention_period = 7
  multi_az                = false
}


resource "aws_db_instance" "replica" {
  identifier              = "my-read-replica"
  engine                  = aws_db_instance.primary.engine
  instance_class          = "db.t3.micro"
  publicly_accessible     = true
  replicate_source_db     = aws_db_instance.primary.identifier
  skip_final_snapshot     = true
}