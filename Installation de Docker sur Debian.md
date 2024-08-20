# Installation de docker sur Debian 12

Pour faire l'installation de docker, copier le script ci-dessous pour et inséré le dans un fichier .sh avec les droit d'execution

pour executer, faite la commande : ./votrescript.sh

## Script

#!/bin/bash

# Mettre à jour les paquets
apt-get update

# Installer les paquets nécessaires
apt-get install -y ca-certificates curl gnupg lsb-release

# Ajouter la clé GPG officielle de Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Ajouter le dépôt Docker au sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Mettre à jour les paquets encore une fois
apt-get update

# Installer Docker
apt-get install -y docker-ce docker-ce-cli containerd.io

# Message de confirmation
echo "Docker a été installé avec succès"
