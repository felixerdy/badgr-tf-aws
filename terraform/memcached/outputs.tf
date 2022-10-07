output "memcached_endpoint" {
  value = aws_elasticache_cluster.memcached.cluster_address
}