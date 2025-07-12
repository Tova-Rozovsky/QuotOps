provider "google" {
  project = "election-433920"
  region  = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "docker-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  service_account {
    email  = "docker-vm-sa@election-433920.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt update && sudo apt install -y docker.io google-cloud-sdk
    sudo systemctl start docker
    sudo systemctl enable docker
    gcloud auth configure-docker
    sudo docker pull gcr.io/election-433920/quote-app100
    sudo docker run -d -p 80:80 gcr.io/election-433920/quote-app100
  EOT
}
