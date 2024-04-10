resource "aws_security_group" "node_instance_sg" {
  name        = "node_instance_sg"
  description = "Security group for the node EC2 instance"

  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Node-Instance-SG"
  }   
}
