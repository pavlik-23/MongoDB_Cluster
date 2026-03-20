# 🚀 MongoDB Cluster Automation (Ansible + GitHub Actions)

![CI](https://github.com/pavlik-23/MongoDB_Cluster/actions/workflows/ci.yml/badge.svg)

This project automates the deployment of a **3-node MongoDB Replica Set** using:

- ⚙️ Ansible
- 🐳 Docker / Docker Compose
- 🔁 GitHub Actions (self-hosted runner)

Built as a **real-world DevOps homelab project**, it demonstrates end-to-end automation:
from infrastructure configuration → to cluster deployment → to validation.

---
**What happens in the demo:**

1. GitHub Action is triggered

2. Runner connects via SSH to all nodes

3. MongoDB containers are deployed

4. Replica set is initialized

5. PRIMARY is elected

6. Smoke test is executed ✅


---

🏗️ Architecture

                 
                 +----------------------+
                 |  GitHub Actions CI   |
                 | Self-hosted runner   |
                 +----------+-----------+
                            |
                            | Ansible over SSH
                            |
        -------------------------------------------------
        |                       |                       |
+---------------+     +---------------+     +---------------+
|   mongo-1     |     |   mongo-2     |     |   mongo-3     |
|   PRIMARY     |     |  SECONDARY    |     |  SECONDARY    |
+---------------+     +---------------+     +---------------+


✨ Features

🔄 Fully automated MongoDB deployment

🧠 Replica Set auto-initialization

🐳 Docker-based setup

⚡ Idempotent Ansible roles

🔍 Automatic PRIMARY detection

🧪 Built-in smoke test

🔐 SSH-based secure automation

🤖 CI/CD with GitHub Actions


| Tool           | Purpose           |
| -------------- | ----------------- |
| Ansible        | Automation        |
| Docker         | Container runtime |
| MongoDB        | Database          |
| GitHub Actions | CI/CD             |
| Linux          | Infrastructure    |



📂 Project Structure

.
├── .github/workflows/ci.yml
├── ansible-mongo/
│   ├── inventory.yml
│   ├── playbook/
│   └── roles/mongo_deploy/
└── README.md


⚙️ Inventory Example

mongo:
  hosts:
    mongo-1:
      ansible_host: 10.192.24.90
    mongo-2:
      ansible_host: 10.192.24.91
    mongo-3:
      ansible_host: 10.192.24.92


🔄 Deployment Flow


GitHub Actions
      ↓
Self-hosted Runner
      ↓
SSH → All nodes
      ↓
Ansible:
  - create dirs
  - deploy docker-compose
  - start MongoDB
      ↓
Replica Set Init
      ↓
PRIMARY election
      ↓
Smoke test ✅



🧪 Smoke Test (Auto Validation)

After deployment, Ansible runs:

idempotent upsert

write validation

replica set verification

Example output:

PRIMARY: mongo-1:27017
SECONDARY: mongo-2
SECONDARY: mongo-3

acknowledged: true


▶️ How to Run
Local

ansible-playbook ansible-mongo/playbook/mongo_deploy.yaml -i ansible-mongo/inventory.yml


**GitHub Actions**

1. Go to Actions

2. Select workflow

3. Click Run workflow

4. Choose deploy


✅ Result

Set: mongodb_27017 | PRIMARY: mongo-1:27017

- mongo-1 PRIMARY
- mongo-2 SECONDARY
- mongo-3 SECONDARY

💡 What This Project Proves
✔ Infrastructure automation
✔ CI/CD pipeline design
✔ Real cluster deployment
✔ Docker + Ansible integration
✔ Self-hosted runner usage
✔ Production-like workflow


🔮 Future Improvements

* Terraform provisioning

* Monitoring (Prometheus + Grafana)

* Backup automation

* Failover testing

* Ansible Molecule tests


👨‍💻 Author

Pavel Botnari
GitHub: https://github.com/pavlik-23
