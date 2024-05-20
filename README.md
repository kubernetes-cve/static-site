# static-site
This repository contains a simple static HTML page served using Caddy and packaged using Docker. Additionally, it includes a Helm chart for managing the deployments.

## Prerequisites

Before you begin, ensure that you have the following tools installed:

- Docker
- Helm
- Caddy
- minikube/kind

## Getting Started

1. Clone this repository:

    ```bash
    git clone https://github.com/your-username/static-site.git
    cd static-site
    ```

2. Make sure you have a local Kubernetes cluster up and running before this step. Add a secret with name regcred for your dockerhub credentials to give access to your private repository

    ```bash
    kubectl create secret docker-registry regcred --docker-server="your-docker-server" --docker-username="your-username" --docker-password="your-password" --docker-email="your-email"
    ```

3. Modify the values of the values.yaml as per your requirement and run the following command to install the helm chart

    ```bash
    helm install my-static-site . -f values.yaml
    ```

4. (Optional) Uninstall the chart

    ```bash
    helm uninstall my-static-site
    ```
