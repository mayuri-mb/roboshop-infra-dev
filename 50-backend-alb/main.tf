resource "aws_lb" "backend_alb" {
    name = "${var.project}-${var.environment}"  #roboshop-dev
    internal = true
    load_balancer_type = "application"
    security_groups = [local.backend_alb_sg_id]
    subnets = local.private_subnet_ids

    #keeping it as false, just to delete using terraform while practice
    enable_deletion_protection = false

    tags = merge(
        {
            Name = "${var.project}-${var.environment}" 
        },
        local.common_tags
    )
}

#aws_lb listener

resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_lb.backend_alb.arn
    port = "80"
    protocol = "HTTP"

    default_action {
        type = "fixed-response"

        fixed_response {
            content_type = "text/html"
            message_body = "<h1>Hi, I am from Backend ALB</h1>"
            status_code = "200"
        }    
    }
}

#route53 record for backend_alb
resource "aws_route53_record" "backend_alb" {
    zone_id = var.zone_id
    name   =  "*.backend-alb-${var.environment}.${var.domain_name}"
    type = "A"

    #load balancer details
    alias {
        name = aws_lb.backend_alb.dns_name
        zone_id = aws_lb.backend_alb.zone_id
        evaluate_target_health = true
    }
}

