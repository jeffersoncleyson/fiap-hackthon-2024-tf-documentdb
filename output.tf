############################################### Restrict API Gateway [API Gateway] Outputs

output "docdb_endpoint" {
  description = "DocumentDB Endpoint."

  value = aws_docdb_cluster.docdb.endpoint
}

###############################################