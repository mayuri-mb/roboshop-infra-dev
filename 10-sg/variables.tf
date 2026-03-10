variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    type = list 
    default = [
        #databases
        "mongodb", "redis", "mysql", "rabbitmq",
        #backend
        "catalogue", "user", "cart", "shipping", "payment",
        #backend load balancer
        "backend_alb",
        #frontend
        "frontend",
        #frontend load balancer
        "frontend_alb",
        #bastion host
        "bastion"        
        ]
}