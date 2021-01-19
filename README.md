# Capstone project 

This repo provides the code for building, testing and deploying a flask application on Kubernetes cluster. Using Jenkins to implement Continuous Integration and Continuous Deployment we will build three Jenkins pipelines:
* Provide the Kubernetes cluster (1 master + 2 worker nodes) on AWS with Ansible - **main branch**
* Build, test and run containers for blue deployment - **blue branch**
* Build, test and run containers for green deployment - **green branch**

## Getting Started

1. Install Jenkins server on AWS EC2 instance: 
- Select OS Ubuntu 18.04 and instance t2.medium.
- Create and download SSH key from AWS
- connect to your instance with the SSH key from above and install Jenkins:
```
sudo apt-get install -y default-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins
```

2. Install Jenkins Plugins:
* Blue Ocean 
* Ansible
* CloudBees AWS Credentials Plugin
* Aqua MicroScanner

3. Install linux packages:
```
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible docker.io git tidy pylint python python3 python-pip
```
* Add jenkins user to docker group:

```
sudo usermod -a -G docker jenkins
```

4. Install python packages:
```
pip install boto boto3 botocore openshift flask
```

5. Configure Jenkins:
* Add your AWS credentials to CloudBees AWS Credentials Plugin
* Add your Aqua MicroScanner credentials to Aqua MicroScanner Plugin

### Build and test the Kubernetes environment

1. Create the pipelins in Blue Ocean importing the repo.
2. Run the master branch pipeline first to create the EC2 instances, the Load Balancer,  install all dependancies and create the Kubernetes cluster. 
3. Look at the Load Balancer URL in AWS console and check that you get valid response from the web site.
4. Run the blue branch pipeline to build, test and deploy the application and the service in Kubernetes cluster. Check the LB URL again and confirm blue deployment was successfull.
5. Run the green branch pipeline to build, test and deploy the application and swich the service to map the green deployment. Check the LB URL again and confirm green deployment was successfull.




## Built With

* [Jenkis](https://jenkins.io) - Jenkins is a self-contained, open source automation server which can be used to automate all sorts of tasks related to building, testing, and delivering or deploying software.
* [Ansible](https://www.ansible.com) - Ansible is an open-source software provisioning, configuration management, and application-deployment tool



## License
[License](../LICENSE.md)

