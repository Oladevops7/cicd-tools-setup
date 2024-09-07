resource "aws_instance" "sonarqube-jenkins" {
  ami                    = "ami-0e86e20dae9224db8"
  instance_type          = "t2.large"
  key_name = "sonarqube"
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id] #connecting vpc sg with our instance
  user_data              = templatefile("./Install.sh", {})

  tags = {
    Name = "Sonarqube Jenkins"
  }

  root_block_device {
    volume_size = 30
  }

}


# create security group for the Jenkins-SonarQube Server
resource "aws_security_group" "jenkins-sg" {
  name        = "Jenkins-sg"
  description = "Sonarqube Jenkins server configuration"

  ingress = [
     for port in [22,80,443,8080,8081,9000] : {
          description = "inbound rules"
          from_port = port
          to_port = port
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
          ipv6_cidr_blocks = []
          prefix_list_ids = []
          security_groups = []
          self = false
     }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Sonarqube-Jenkins SG"
  }
}