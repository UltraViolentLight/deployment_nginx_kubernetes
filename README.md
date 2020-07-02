# Deploy a nginx webserver to kubernetes

> Final Project of the Udacity DevOps Nanodegree Program

> Shell, DevOps, AWS, k8s

---

## Table of Contents 

- [Intruduction](#intruduction)
- [Requirements](#requirements)
- [Example](#example)
- [Installation](#installation)
- [WebAppUrl](#webapprl)
- [Credits](#credits)

## Intruduction

Following skillset will be showcased
- Working in AWS
- Using Jenkins to implement Continuous Integration and Continuous Deployment
- Building pipelines
- Working with Ansible and CloudFormation to deploy clusters
- Building Kubernetes clusters
- Building Docker containers in pipelines

---

## Requirements

- Jenkins on EC2 with docker installed
- Jenkins user added to docker gorup 
```shell
sudo usermod -a -G docker jenkins
```
- AWS subscription in order to deploy to AWS EKS



---

## Example

```shell
$ chmod +x scripts/create.sh 
$ ./scripts/create.sh <STACKNAME> network.yml parameter/network-parameters.json
```

---

## Installation

### Clone

- Clone this repo to your local machine using `git clone https://github.com/UltraViolentLight/deployment_nginx_kubernetes`

### Setup
> Setup and configure your own AWS subscription in order to deploy the infrastrcuture yourself.

> Setup and configure AWS CLI to run the aws command as shown [here](https://aws.amazon.com/de/cli/).

---

## Credits

- All Data was provided by the Udacity Data Analyst Nanodegree Program 


