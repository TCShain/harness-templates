resource "aws_service_discovery_public_dns_namespace" "public_dns" {
  name = "${var.namespace}.${var.stage}.${var.name}"
}

resource "aws_service_discovery_service" "service" {
  name = "${var.namespace}-${var.stage}-${var.name}-ns"

  dns_config {
    namespace_id = aws_service_discovery_public_dns_namespace.public_dns.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}