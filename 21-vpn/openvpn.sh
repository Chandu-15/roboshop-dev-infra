#!/bin/bash
set -euo pipefail

# 1. Install prerequisites for RHEL/AL2023
dnf install -y wget net-tools

# 2. Add the OpenVPN Access Server Repository for RHEL 9
wget https://as-repository.openvpn.net/as-repo-public.gpg -O /etc/pki/rpm-gpg/RPM-GPG-KEY-OpenVPN
dnf config-manager --add-repo https://as-repository.openvpn.net/as-repo-rhel9.repo

# 3. Install OpenVPN Access Server
dnf install -y openvpn-as

SCRIPTS="/usr/local/openvpn_as/scripts"
USERNAME="openvpn"
PASSWORD='Openvpn@123'

# 4. Wait for the service to start
until curl -ks https://127.0.0.1:943/ >/dev/null 2>&1; do 
    echo "Waiting for OpenVPN Admin UI..."
    sleep 5
done

# 5. Configuration
$SCRIPTS/sacli --key 'eula_accepted' --value 'true' ConfigPut
$SCRIPTS/sacli --user "$USERNAME" --new_pass "$PASSWORD" SetLocalPassword
$SCRIPTS/sacli --user "$USERNAME" --key 'prop_superuser' --value 'true' UserPropPut
$SCRIPTS/sacli --key 'vpn.server.port' --value '1194' ConfigPut
$SCRIPTS/sacli --key 'vpn.server.protocol' --value 'udp' ConfigPut
$SCRIPTS/sacli ConfigSync
$SCRIPTS/sacli start