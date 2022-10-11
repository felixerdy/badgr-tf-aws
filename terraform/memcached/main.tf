resource "aws_elasticache_parameter_group" "default" {
  name   = "memcached-params"
  family = "memcached1.6"
}

resource "aws_elasticache_cluster" "memcached" {
  cluster_id           = "memcached-cluster"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.default.name
  port                 = 11211
}
