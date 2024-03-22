resource "aws_docdb_subnet_group" "service" {
  name       = "subnet-group-${var.cluster_name}"
  subnet_ids = var.vpc_private_subnets
}

resource "aws_docdb_cluster_instance" "service" {
  count              = 1
  identifier         = "${var.cluster_name}-${count.index}"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = var.instance_class
}

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier              = var.cluster_name
  engine                          = "docdb"
  db_subnet_group_name            = aws_docdb_subnet_group.service.name
  master_username                 = var.username_admin
  master_password                 = var.password_admin
  backup_retention_period         = 1
  preferred_backup_window         = "07:00-09:00"
  skip_final_snapshot             = true
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.parameter_group.name
  vpc_security_group_ids          = ["${var.vpc_sg_id}"]

  tags = {
    App = var.application_name
  }
}

resource "aws_docdb_cluster_parameter_group" "parameter_group" {
  family = "docdb5.0"
  name   = "tf-${var.cluster_name}"

  parameter {
    name  = "tls"
    value = "disabled"
  }
}
