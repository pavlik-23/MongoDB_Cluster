# 🚀 MongoDB Cluster Automation (Ansible + GitHub Actions)

![CI](https://github.com/pavlik-23/MongoDB_Cluster/actions/workflows/ci.yml/badge.svg)

This project automates the deployment of a **production-style 3-node MongoDB Replica Set** using:

* ⚙️ Ansible
* 🐳 Docker / Docker Compose
* 🤖 GitHub Actions (self-hosted runner)

It demonstrates a **real-world DevOps workflow**:
from infrastructure setup → to cluster deployment → to automated validation.

---

## 🎬 Demo

![Demo](docs/demo.gif)

---

## 💡 What This Project Proves

✔ Infrastructure automation
✔ CI/CD pipeline design
✔ Real multi-node cluster deployment
✔ Docker + Ansible integration
✔ Self-hosted runner usage
✔ Production-like workflow

---

## ⚙️ Deployment Flow

1. GitHub Action is triggered
2. Runner connects via SSH to all nodes
3. MongoDB containers are deployed
4. Replica Set is initialized
5. PRIMARY is elected
6. Smoke test is executed ✅

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
├── ansible-mongo/
│   ├── inventory.yml
│   ├── playbook/
│   │   └── mongo_deploy.yaml
│   └── roles/
│       └── mongo_deploy/
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
PRIMARY: mongo-1:27017
SECONDARY: mongo-2
SECONDARY: mongo-3

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

* Terraform provisioning
* Monitoring (Prometheus + Grafana)
* Backup automation
* Failover testing
* Ansible Molecule tests

---

## 👤 Author

**Pavel Botnari**
GitHub: https://github.com/pavlik-23

---

