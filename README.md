Infrastructure Setup with Terraform: Jenkins, SonarQube, Sonatype Nexus, and Docker
This project provides a Terraform-based infrastructure setup to deploy and configure a Continuous Integration/Continuous Delivery (CI/CD) pipeline environment featuring Jenkins, SonarQube, Sonatype Nexus, and Docker.


Access the Services
Once the infrastructure is provisioned, you can access the services using the public IPs or DNS names provided in the output:

Jenkins: http://<jenkins_public_ip>:8080
SonarQube: http://<sonarqube_public_ip>:9000
Sonatype Nexus: http://<nexus_public_ip>:8081
Docker: You can SSH into the Docker server to manage your Docker containers.

