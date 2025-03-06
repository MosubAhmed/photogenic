Photogenic - End-to-End CI/CD Pipeline Project 🚀
Welcome to the Photogenic project! This repository showcases a fully automated CI/CD pipeline that takes your code from commit to deployment in a Kubernetes cluster. The pipeline leverages Jenkins, Docker, Ansible, and Kubernetes to ensure a seamless and reliable deployment process.

📂 Project Structure
photogenic/
├── Jenkinsfile          # Jenkins pipeline script
├── Dockerfile           # Dockerfile for containerizing the application
├── ansible/             # Ansible playbooks and inventory files
│   ├── ansible.yml      # Main Ansible playbook for deployment
│   └── hosts            # Inventory file for Ansible
├── kubernetes/          # Kubernetes deployment manifests
│   └── deployment.yml   # Kubernetes deployment configuration
└── src/                 # Application source code
    └── app.py           # Sample application code

![photographia](https://github.com/user-attachments/assets/f9f2bfa1-2b5e-49f8-b856-90995e226fc4)



🛠️ Tools & Technologies Used
Jenkins: For orchestrating the CI/CD pipeline.

Docker: For containerizing the application.

Docker Hub: For storing Docker images.

Ansible: For configuration management and deployment automation.

Kubernetes: For container orchestration and scalable deployment.




🚀 Pipeline Overview
Git Checkout: The pipeline starts by checking out the code from the main branch of this repository.
File Sync to Ansible Server: Files are synced to the Ansible server using rsync.
Docker Build: A Docker image is built and tagged with the job name and build ID.
Docker Tagging: The Docker image is tagged for Docker Hub.
Push to Docker Hub: The Docker image is pushed to Docker Hub.
Ansible Playbook Execution: Ansible playbooks are executed to deploy the application to the Kubernetes cluster.



🛠️ Setup Instructions
Prerequisites
Jenkins server with SSH agent plugin installed.
Ansible server with SSH access to the Kubernetes cluster.
Docker Hub account for pushing Docker images.
Kubernetes cluster for deployment.



Steps
Clone the Repository:
  git clone https://github.com/MosubAhmed/photogenic.git
  cd photogenic


Set Up Jenkins Pipeline:
  Create a new Jenkins pipeline job.
  Point the pipeline script to the Jenkinsfile in this repository.

Configure Credentials:
  Add ansible_server and dockerhub credentials in Jenkins.

Run the Pipeline:
  Trigger the pipeline manually or via a Git webhook.

Verify Deployment:
  Check the Kubernetes cluster to ensure the application is deployed successfully.


📜 Jenkins Pipeline Script
The Jenkins pipeline script (Jenkinsfile) automates the entire process. Here’s a brief overview of the stages:
  Git Checkout: Clones the repository.
  Sending Files to Ansible Server: Uses rsync to transfer files.
  Docker Build: Builds the Docker image.
  Docker Tagging: Tags the Docker image for Docker Hub.
  Push Docker Images: Pushes the Docker image to Docker Hub.
  Ansible Playbook Execution: Runs Ansible playbooks to deploy to Kubernetes.



🤝 Contributing
  Contributions are welcome! If you have any suggestions or improvements, feel free to open an issue or submit a pull request.

📄 License
  This project is licensed under the MIT License. See the LICENSE file for details.
