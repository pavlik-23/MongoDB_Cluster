# 🚀 MongoDB Cluster Automation

This project demonstrates a fully automated deployment of a MongoDB replica set using Ansible, Docker Compose, and GitHub Actions.

The goal is to provide a repeatable, production-like setup for deploying and validating a 3-node MongoDB cluster, including replica set initialization, primary election, and health verification.

This project reflects real-world DevOps practices such as infrastructure automation, idempotent configuration, and CI-based validation.


![CI](https://github.com/pavlik-23/MongoDB_Cluster/actions/workflows/ci.yml/badge.svg)

This project automates the deployment of a **production-style 3-node MongoDB Replica Set** using:

* ⚙️ Ansible
* 🐳 Docker / Docker Compose
* 🤖 GitHub Actions (self-hosted runner)

It demonstrates a **real-world DevOps workflow**:
from infrastructure setup → to cluster deployment → to automated validation.

---

## 💡 What This Project matters

- Automates complex MongoDB cluster setup
- Ensures consistent and repeatable deployments
- Reduces manual configuration errors
- Demonstrates real-world DevOps practices
- Includes validation and health checks after deployment

---

## ⚙️ Deployment Flow

1. GitHub Action is triggered
2. Runner connects via SSH to all nodes
3. MongoDB containers are deployed
4. Replica Set is initialized
5. PRIMARY is elected
6. Smoke test is executed ✅

## Assumptions

- Tested on Linux-based environments
- Requires Docker installed on target hosts
- Designed as a production-like simulation project

---

## 🏗️ Architecture

```
                  GitHub Actions (CI)
                         │
                         ▼
                 Self-hosted Runner
                         │
                         ▼
                   Ansible (SSH)
                         │
    ┌───────────────┬───────────────┬───────────────┐
    │   mongo-1     │   mongo-2     │   mongo-3     │
    │   PRIMARY     │   SECONDARY   │   SECONDARY   │
    └───────────────┴───────────────┴───────────────┘
```

---

## ✨ Features

* 🔄 Fully automated MongoDB deployment
* 🧠 Replica Set auto-initialization
* 🐳 Docker-based infrastructure
* ⚡ Idempotent Ansible roles
* 🔍 Automatic PRIMARY detection
* 🧪 Built-in smoke test
* 🔐 SSH-based secure automation
* 🤖 CI/CD with GitHub Actions

---

## 🧰 Tech Stack

| Tool           | Purpose           |
| -------------- | ----------------- |
| Ansible        | Automation        |
| Docker         | Container runtime |
| MongoDB        | Database          |
| GitHub Actions | CI/CD             |
| Linux          | Infrastructure    |

---

## 📂 Project Structure

```
.
├── .github/workflows/ci.yml
├── ansible-mongo
├── inventory
│   ├── group_vars
│   │   ├── all.yml
│   │   ├── check.yml
│   │   └── mongo.yml
│   └── hosts.yml
├── playbook
│   ├── check.yaml
│   └── mongo_deploy.yaml
├── roles
|   |── check
│   └── mongo_deploy
├── README.md
```

---

## ⚙️ Inventory Example

```yaml
mongo:
  hosts:
    mongo-1:
      ansible_host: <IP_1>
    mongo-2:
      ansible_host: <IP_2>
    mongo-3:
      ansible_host: <IP_3>
```

---

## 🚀 Deployment Flow (Detailed)

GitHub Actions → Self-hosted Runner → SSH → All nodes → Ansible:

* create directories
* deploy docker-compose
* start MongoDB
* initialize Replica Set
* elect PRIMARY
* run smoke test ✅

---

## 🧪 Smoke Test (Auto Validation)

After deployment, Ansible runs:

* idempotent upsert
* write validation
* replica set verification

### Example Output

```
PRIMARY:   mongo-1:27017
SECONDARY: mongo-2:27017
SECONDARY: mongo-3:27017

acknowledged: true
```

---

## ▶️ How to Run Local

```bash
ansible-playbook ansible-mongo/playbook/mongo_deploy.yaml -i ansible-mongo/inventory.yml
```

---

## 🤖 GitHub Actions

1. Go to **Actions**
2. Select workflow
3. Click **Run workflow**
4. Choose `deploy`

---

## ✅ Result

```
Set: mongodb_27017 | PRIMARY: mongo-1:27017

- mongo-1 PRIMARY
- mongo-2 SECONDARY
- mongo-3 SECONDARY
```

---

## 🔮 Future Improvements

* Monitoring (Prometheus + Grafana)
* Backup automation
* Failover testing
* Ansible Molecule tests

---

## 👤 Author

**Pavel Botnari**
GitHub: https://github.com/pavlik-23

---

