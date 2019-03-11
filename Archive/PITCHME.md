# SQL Server and Containers

---

## Andrew Pruski

### SQL Server DBA & Microsoft Data Platform MVP

@fa[twitter] @dbafromthecold <br>
@fa[envelope] dbafromthecold@gmail.com <br>
@fa[wordpress] www.dbafromthecold.com <br>
@fa[github] github.com/dbafromthecold

---

### Session Aim

To give an overview of the different options available to run SQL Server in containers

---

### Agenda

<b>Part One</b> - Introduction to docker (demos) </br>
<b>Part Two</b> - Running containers in Azure

---

### Container Definition

Containers wrap a piece of software in a complete filesystem that contains everything needed to run: code, runtime, system tools, system libraries – anything that can be installed on a server. This guarantees that the software will always run the same, regardless of its environment. <br>

@size[0.8em](https://www.docker.com/what-docker)

---

### Virtual Machines vs Containers

<img src="assets/images/VmsVsContainers.png" style="float: right;" size=medium border=none/>

---

## Demos

---

### Azure

Azure Container Registry <br>
Azure Container Instances <br>
Azure Container Services

---

## Azure Container Registry

---

### Azure Container Registry

@size[0.8em](https://azure.microsoft.com/en-us/services/container-registry/)

<img src="assets/images/AzureContainerRegistry.png">

---

### Terminology

<b>Registry</b><br>
Service that stores container images<br>
<br>
<b>Repository</b><br>
Groups of container images – Same name, identified by tags<br>
	
---

### Features

<b>Encryption</b><br>
All images encrypted at rest<br>
<b>Geo-redundant storage</b><br>
Replication of images<br>
<b>Geo-replication</b><br>
Guards against total regional failure<br>
<b>ACR Tasks</b><br>
Container image build service<br>

---

### SKUs

<img src="assets/images/ACR-SKUs.png">

---?code=assets/code/acr_login.azcli&lang=bash&title=Login to Azure Account

<img src="assets/images/ACR-Login.png">

---?code=assets/code/acr_create_resource_group.azcli&lang=bash&title=Create Resource Group

<img src="assets/images/ACR-CreateResourceGroup.png">

---?code=assets/code/acr_create_registry.azcli&lang=bash&title=Create Registry

<img src="assets/images/ACR-CreateRegistry.png">

---?code=assets/code/acr_login_registry.azcli&lang=bash&title=Log into Registry

<img src="assets/images/ACR-LoginToRegistry.png">

---?code=assets/code/acr_get_registry_details.azcli&lang=bash&title=Get Registry Details

<img src="assets/images/ACR-GetRegistryDetails.png">

---?code=assets/code/acr_tag_image.azcli&lang=bash&title=Tag Image

<img src="assets/images/ACR-TagImage.png">

---?code=assets/code/acr_push_image.azcli&lang=bash&title=Push Image

<img src="assets/images/ACR-PushImage.png">

---?code=assets/code/acr_list_repos.azcli&lang=bash&title=List Repositories

<img src="assets/images/ACR-ListRepos.png">

---?code=assets/code/acr_show_tags.azcli&lang=bash&title=Show Tags

<img src="assets/images/ACR-ShowTags.png">

---

## Demo

---

## Azure Container Instances

---

### Azure Container Instances

@size[0.8em](https://azure.microsoft.com/en-us/services/container-instances/)

<img src="assets/images/AzureContainerInstances.png">

---

### Azure Container Instances

Running containers without servers <br>
No need to manage VMs <br>
Quick deployment <br>
Deployed via the CLI, powershell, or Azure Portal <br>
Billed by the second

---

### Options

Linux & Windows containers <br>
Containers exposed directly to the internet <br>
IP Address and FQDN <br>
Hypervisor level isolation <rb>
Persistent storage <br>
Azure files shares

---

### Container Groups

Similar in concept to K8s pods <br>
Multiple containers running on the same host <br>
Share IP address, containers exposed on ports <br>
Supports mounting external volumes

---?code=assets/code/aci_get_credentials.azcli&lang=bash&title=Get Credentials

@[1](Enable admin)
@[3](Show credentials)

---?code=assets/code/aci_create_keyvault.azcli&lang=bash&title=Create Keyvault

@[1-2](Create keyvault)
@[4-10](Create service principle and store password)
@[12-16](Store username)

---?code=assets/code/aci_create_container.azcli&lang=bash&title=Create Container

@[2](From custom image)
@[3](Specifying the resource group)
@[4-7](Retrieving the username stored in keyvault)
@[8-11](Retrieving the password stored in keyvault)
@[12](Setting the container name)
@[13](Specifying resources available to container)
@[14](Setting the required environment variables)
@[15](Specifying the IP address type)
@[16](Specifying the port to connect to)

---?code=assets/code/aci_get_container_status.azcli&lang=bash&title=Get Container Status

<p align=center>
<img src="assets/images/ACI-GetContainerStatus.png">
</p>

---

### Connect to Azure Container Instance

<img src="assets/images/ACI-ConnectToContainer.png">

---

## Demo

---

## Azure Container Services

---

### Azure Container Services

@size[0.8em](https://azure.microsoft.com/en-us/services/container-service/)

<img src="assets/images/AzureContainerServices.png">

---

### Azure Container Services

<br><b>Two flavours</b> <br>
Azure Container Services (ACS) <br>
Azure Container Services (AKS) <br>
<br>
ACS allows multiple orchestrators <br>
AKS is specifically built to implement Kubernetes

---

### Kubernetes

<img src="assets/images/AKS-KubernetesLogo.png" style="float: right"/>

<br>
@size[0.9em](Open source) <br>
@size[0.9em](Deployed as a cluster) <br>
@size[0.9em](Pods hold containers on nodes) <br>
@size[0.9em](Services provide external access) <br>
@size[0.9em](Kubectl used to manage cluster) <br>

---

### Azure Container Services (AKS)

Simplifies deployment of Kubernetes clusters <br>
Cluster can be spun up with one line of code <br>
Applications deployed to cluster via yaml files <br>
Managed by Azure-CLI/powershell and kubectl <br>

---?code=assets/code/aks_create_cluster.azcli&lang=bash&title=Create Cluster

@[2](Specify the resource group)
@[3](Give the cluster a name)
@[4](Specify the number of nodes)
@[5](Generate keys so that we can connect)

<img src="assets/images/AKS-CreateCluster.png">

---?code=assets/code/aks_install_kubectl.azcli&lang=bash&title=Install Kubectl

<img src="assets/images/AKS-InstallKubectl.png">

---?code=assets/code/aks_get_cluster_credentials.azcli&lang=bash&title=Get Cluster Credentials

<img src="assets/images/AKS-GetClusterCredentials.png">

---?code=assets/code/aks_view_cluster_nodes.azcli&lang=bash&title=View Cluster Nodes

<img src="assets/images/AKS-ViewNodes.png">

---?code=assets/code/aks_create_role.azcli&lang=bash&title=Create Role

@[1-5](Get cluster ID)
@[7-11](Get Azure Container Registry ID)
@[13-16](Create role to allow access to ACR)

---?code=assets/code/aks_yaml_file.yaml&lang=yaml&title=AKS yaml file

@[3-6](Metadata of deployment)
@[8](Number of replicas)
@[13-23](Pod declaration)
@[15](Pod name)
@[16](Image to be used)
@[17-18](Port on pod)
@[19-23](Setting environment variables)
@[24-35](Service)
@[26-27](Metadata)
@[29-32](Port on service to port on pod)
@[33-35](Selector)
@[35](External IP address)

---?code=assets/code/aks_deploy_to_cluster.azcli&lang=bash&title=Deploy to Cluster

<img src="assets/images/AKS-DeployToCluster.png">

---?code=assets/code/aks_deployment_info.azcli&lang=bash&title=View Deployment

@[1](View deployments)
@[2](View nodes)
@[3](View services)

<img src="assets/images/AKS-DeploymentInformation.png">

---

### Connect to SQL Server

<img src="assets/images/AKS-ConnectToSqlServer.png">

---

### Kubernetes Dashboard

<img src="assets/images/AKS-KubernetesDashboard.png">

---

## Demo

---

## Case Study

---

### Problem

QA/Dev departments repeatedly creating new VMs <br>
All VMs require a local instance of SQL Server <br>
SQL installed from chocolately <br>
30+ databases then restored via PoSH scripts <br>
SQL install taking ~40 minutes from start to finish

---

### Solution

Containers! <br>
Implement containers running SQL Server <br>
SQL containers built from custom image <br>
No longer need to install SQL <br>
No longer need to restore databases <br>
Resources freed up on VMs 

---

### Windocks

A port of the open source project from Docker Inc. <br>
Software supports the creation of containers running earlier versions of SQL Server (2008+) on Windows Server 2008+ <br>
Free Community Edition available 

---

### Architecture

<p align="center">
<img src="assets/images/Windocks.png" size=small border=none/>
</p>

---

### Benefits

New VMs deployed in a fraction of the previous time <br>
No longer need to run PoSH scripts to restore databases <br>
Base image can be used to keep containers at production level <br>
More VMs can be provisioned on host due to each VM requiring less resources 

---

### Issues

 
Apps using DNS entries to reference local SQL instance <br>
Update to existing test applications <br>
Trial and error to integrate with Octopus deploy <br>
New ways of thinking 


---

### Resources

https://github.com/dbafromthecold/SqlServerAndContainersExtended <br>
<br>
https://dbafromthecold.com/2017/03/15/summary-of-my-container-series/ 

@snap[east]
![QR](assets/images/SqlServerAndContainersExtended.png)
@snapend
