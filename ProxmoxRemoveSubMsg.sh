#! /bin/bash
# Sauvegarde du fichier Original
cp /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js.bak
# Mise a jour du fichier JS
sed -i.bak "s/.data.status.toLowerCase() !== 'active') {/.data.status.toLowerCase() !== 'active') { orig_cmd\(\); } else if ( false ) {/" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
# Redémarrage de l'interface web de proxmox VE
systemctl restart pveproxy.service
# Redémarrage de l'interface web de proxmox BS
systemctl restart proxmox-backup-proxy.service
# Si besoin de retrourné en arrière, supprimer le fichier "proxmoxlib.js" et renommé le fichier "proxmoxlib.js.bak" en "proxmoxlib.js"
