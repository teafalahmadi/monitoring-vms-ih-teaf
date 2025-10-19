# 🖥️ Monitoring Azure Virtual Machines with Prometheus & Grafana

This project demonstrates how to monitor Azure Virtual Machines (VMs) using **Prometheus**, **Node Exporter**, and **Grafana** — all provisioned and automated with **Terraform** and **Ansible**.

---

## 📊 Overview

The goal is to build a complete monitoring pipeline:
- **Terraform** provisions the infrastructure (2 VMs + Network + Security Groups)
- **Ansible** installs and configures Prometheus agents (Node Exporter, cAdvisor)
- **Grafana** visualizes metrics like CPU, Memory, and Network in real-time

---

## ⚙️ Tools Used

| Tool | Purpose |
|------|----------|
| Terraform | Infrastructure as Code |
| Ansible | Configuration Management |
| Prometheus | Metrics Collection |
| Node Exporter | VM Metrics Exporter |
| Grafana | Visualization Dashboard |
| Azure VMs | Compute Environment |

---

## 🧠 Key Features

- Automated provisioning using Terraform  
- Secure SSH access with dynamic keys  
- Node Exporter + cAdvisor deployment using Ansible  
- Live metrics visualization in Grafana  
- CPU stress test verification with `stress --cpu 4 --timeout 180`

---

## 🚀 Results

After applying CPU load on the backend VM, Grafana successfully reflected the spike in CPU usage, confirming that the monitoring setup works as expected 🎯

![Grafana Dashboard](./images/grafana-cpu-usage.png)

---

## 🔗 Repository

[GitHub — teafalahmadi/monitoring-vms-ih-teaf](https://github.com/teafalahmadi/monitoring-vms-ih-teaf.git)

---

## 🏫 Project Info

Bootcamp: **Saudi Digital Academy × Ironhack**  
Module: **Week 8 — Monitoring & Observability**  

---

👩‍💻 **Author:** [Teaf Alahmadi](https://www.linkedin.com/in/teafalahmadi)  
#DevOps #Grafana #Prometheus #Azure #Terraform #Ansible #Ironhack #Cloud
