#!/bin/bash

# Read the doc: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
# if something does not work, k8s could have changed their install process.

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
if ! echo "$(<kubectl.sha256) kubectl" | sha256sum --check -; then
    echo "Checksum failed" >&2
    exit 1
fi

chmod +x kubectl
mv ./kubectl ~/.local/bin/
rm kubectl.sha256
echo "All good. Installed in ~/.local/bin"
