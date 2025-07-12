# QuotOps 🌤️  
**Minimal Flask App for Serving Inspirational Quotes + Prometheus Monitoring on Minikube**

## 📖 Overview

**QuotOps** is a lightweight web app built with Flask that displays random inspirational quotes.  
It includes Kubernetes manifests for local deployment via **Minikube**, and integrates Prometheus monitoring.

## ✨ Features

- 🌈 View a random quote each time you visit  
- 🔧 Flask-based web app (single endpoint)  
- 🚢 Deployable on Minikube (Kubernetes local cluster)  
- 📊 Exposes metrics to Prometheus using `prometheus_flask_exporter`  

---

## 🛠️ Tech Stack

- Python 3.x + Flask  
- Docker  
- Kubernetes (via Minikube)  
- Prometheus  
- `prometheus_flask_exporter`  

---

## 🧪 Running Locally (No Kubernetes)

```bash
git clone https://github.com/your-username/quotops.git
cd quotops

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

flask run


## 🧪 Running Locally

1. Clone the repository:
git clone https://github.com/your-username/quotops.git
cd QuotOps
<pre><code>
```bash python3 -m venv venv 
source venv/bin/activate
 pip install -r requirements.txt
 flask run ```
</code></pre>


