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
<b>Part Two</b> - Overview of Kubernetes

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

# Kubernetes

---

## What is Kubernetes?

@quote[Kubernetes is a portable, extensible open-source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available](kubernetes.io)

---

## Kubernetes

<img src="assets/images/KubernetesLogo.png" style="float: right"/>

<br>
@size[0.9em](Open source orchestration engine) <br>
@size[0.9em](Designed by Google) <br>
@size[0.9em](Hosted by the Cloud Native Computing Foundation) <br>
@size[0.9em](Kubernetes v1.0 was released on July 21, 2015)

---

## Master

<img src="assets/images/master-128.png" style="float: right"/>

Components for controlling the cluster<br>

@ul
- @size[0.9em](kube-apiserver)<br>
- @size[0.9em](etcd)<br>
- @size[0.9em](kube-scheduler)<br>
- @size[0.9em](kube-controller-manager)<br>
- @size[0.9em](cloud-controller-manager)<br>
@ulend

---

## Nodes

<img src="assets/images/node-128.png" style="float: right"/>

Running and maintaining pods<br>

@ul
- @size[0.9em](kubelet)<br>
- @size[0.9em](kube-proxy)<br>
- @size[0.9em](Docker)
@ulend

---

## Pods

<img src="assets/images/master-128.png" style="float: right"/>

Smallest deployable units of computing<br>
Group of one or more containers<br>
Shared storage/network<br>
Holds specifications of containers

---

## Services

<img src="assets/images/svc-128.png" style="float: right"/>

An abstraction over a set of pods<br>
Provides a stable networking endpoint<br>
Different types: -<br>

@ul
- @size[0.9em](ClusterIP)<br>
- @size[0.9em](NodePort)<br>
- @size[0.9em](LoadBalancer)<br>
- @size[0.9em](External Name)
@ul

---?code=assets/code/deployment_yaml_file.yaml&lang=yaml&title=Example yaml file

@[3-4](Metadata of deployment)
@[6](Number of replicas)
@[11-21](Pod declaration)
@[13](Pod name)
@[14](Image to be used)
@[15-16](Port)
@[17-21](Setting environment variables)
@[22-35](Service)
@[24-25](Metadata)
@[27-30](Port on service to port on pod)
@[31-33](External IP address)

---

# Demo

---

### Resources

https://github.com/dbafromthecold/SqlServerAndContainersExtended <br>
<br>
https://dbafromthecold.com/2017/03/15/summary-of-my-container-series/ 

@snap[east]
![QR](assets/images/SqlServerAndContainersExtended.png)
@snapend
