#!/bin/bash
# For Ubuntu 22.04

# Installing Java
echo "Installing Java"
sudo apt update -y
sudo apt install openjdk-17-jre -y
sudo apt install openjdk-17-jdk -y
java --version
sleep 2

# Installing Jenkins
echo "Installing Jenkins"
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sleep 2

# Installing Docker
echo "Installing Docker"
sudo apt update
sudo apt install docker.io -y
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
sudo apt install docker-compose -y 
sudo systemctl restart docker
sudo chmod 777 /var/run/docker.sock
sleep 2

# Run Docker Container of Sonarqube
echo "Running Sonarqube Docker Container"
sudo docker run -d  --name sonar -p 9000:9000 sonarqube:lts-community
sleep 2

# Installing AWS CLI
# Uncomment and customize as needed
# echo "Installing AWS CLI"
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# sudo apt install unzip -y
# unzip awscliv2.zip
# sudo ./aws/install
# sleep 2

# Installing GCloud CLI
# Uncomment and customize as needed
# echo "Installing GCloud CLI"
# curl https://sdk.cloud.google.com | bash -y
# source $HOME/google-cloud-sdk/path.bash.inc
# gcloud init
# sleep 2

# Installing Kubectl
echo "Installing Kubectl"
sudo apt update
sudo apt install curl -y
sudo curl -LO "https://dl.k8s.io/release/v1.28.4/bin/linux/amd64/kubectl"
sudo chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client
sleep 2

# Installing Terraform
echo "Installing Terraform"
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform -y
sleep 2

# Installing Trivy
echo "Installing Trivy"
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt update
sudo apt install trivy -y
sleep 2
