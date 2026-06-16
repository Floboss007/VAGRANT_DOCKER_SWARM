# Docker Swarm Cluster via Vagrant

A Docker Swarm project orchestrated using Vagrant. It includes a `Vagrantfile` and specialized provisioning scripts that automatically deploy three virtual machines using VirtualBox, with Docker pre-installed on all nodes. The Docker Swarm cluster is initialized by a dedicated manager script, and the worker nodes join the swarm completely through automation.

## 📂 Project Directory Structure

The `scripts/` directory contains all the required provisioning scripts:

*   **`scripts/docker-install.sh`**: Provisioned on all virtual machines to handle the base Docker installation.
*   **`scripts/manager.sh`**: Specific to the `manager1` VM. It initializes the Docker Swarm cluster and generates an executable join script for the workers inside the shared `/vagrant` folder. the script will be overwritten when you run vagrant up afresh.
*   **`scripts/worker.sh`**: Provisions the worker machines, automatically executing the generated script to join them to the swarm cluster.

---

## ⚡ Deployment & Service Creation

After all three machines are successfully created and provisioned, you can deploy services to your cluster:

1. SSH into the manager node:
   ```bash
   vagrant ssh manager1
   ```
2. Deploy a service across the swarm using `docker service create` with your preferred parameters:
   ```bash
   docker service create --name my-nginx -p 8080:80 nginx:latest
   ```
3. Once deployed, you can view and access the web server directly from your host system's browser at:
   `http://localhost:8080`

---

## 📋 Requirements

### 💻 System Requirements
*   **Vagrant**:  installed on host machine
*   **VirtualBox**: Installed on the host machine.
*   **Operating System**: Windows (Note: A different `vm.box` architecture configuration will be required if running on a Mac).

### 🌐 Network & Port Requirements
*   **Private Network Subnet**: The environment utilizes the static IP range `192.168.56.11` through `192.168.56.13`. Ensure no other local applications or active virtual networks are using this subnet.
*   **Host Port Availability**: Port `8080` must be completely open and unused on your Windows host machine, as the Vagrant script binds directly to this port. If you have a local web server (such as IIS, XAMPP, or Jenkins) running on port 8080, please stop it before executing `vagrant up`.
