resource "aws_route_53" "mongodb" {
    zone_id = var.zone.id
    name = "mongodb-${var.environment}-${var.domain_name}"
    type = "A"
    ttl = "1"
    records = [aws_instance.mongodb.private_ip]
    allow_overwrite = true
}

resource "aws_route_53" "redis" {
    zone_id = var.zone.id
    name = "redis-${var.environment}-${var.domain_name}"
    type = "A"
    ttl = "1"
    records = [aws_instance.redis.private_ip]
    allow_overwrite = true
}