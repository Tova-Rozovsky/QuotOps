# QuotOps 🌤️  
**Minimal Flask App for Serving Inspirational Quotes + Prometheus Monitoring on Minikube**

## 📖 Overview

**QuotOps** is a lightweight web app built with Flask that displays random inspirational quotes.  
It includes Kubernetes manifests for local deployment via **Minikube**, and integrates Prometheus monitoring.

## ✨ Features

- 🌈 View a random quote each time you visit  
- 🔧 Flask-based web app (single endpoint)  
- 🚢 Deployable on Minikube (Kubernetes local cluster)  
- 📊 Exposes metrics to Prometheus using `prometheus_client`  

---

## 🛠️ Tech Stack

- Python 3.9 + Flask  
- Docker  
- Kubernetes (via Minikube)  
- Prometheus  
- `prometheus_client`  

---

## 🧪 Running Locally (No Kubernetes)

```bash
git clone https://github.com/tova-rozovsky/quotops.git
cd quotops

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

flask run
```
---
## ⚙️ Quick Start (Minikube Deployment)
This project includes full setup files for deploying the app on Minikube.

✅ Prerequisites
Before running the setup, make sure you have:

✅ Docker image built (myapp:monitoring)

✅ Minikube installed 

🚀 Deploy with one command:
Once all prerequisites are met:

```bash
./setup.sh
```

🧱 App Deployment & Service

📈 Prometheus monitoring

**Then access the app and open Prometheus**
```bash
minikube service
```
