#! /bin/bash
# Mise a jour du fichier JS
sed -i.bak "s/.data.status.toLowerCase() !== 'active') {/.data.status.toLowerCase() !== 'active') { orig_cmd\(\); } else if ( false ) {/" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
# Redémarrage de l'interface web de proxmox VE
systemctl restart pveproxy.service
# Redémarrage de l'interface web de proxmox BS
systemctl restart proxmox-backup-proxy.service
