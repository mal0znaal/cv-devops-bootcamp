#!/usr/bin/env bash
set -euo pipefail
mkdir -p /opt/cvbootcamp33/site
printf 'CV-SERVICE-READY\n' >/opt/cvbootcamp33/site/index.html
chmod 755 /opt/cvbootcamp33 /opt/cvbootcamp33/site
chmod 644 /opt/cvbootcamp33/site/index.html
cat > /etc/systemd/system/cvbootcamp33.service <<'EOF'
[Unit]
Description=CV Bootcamp broken training service
After=network.target

[Service]
Type=simple
User=nobody
ExecStart=/usr/bin/python3 -m http.server 8873 --bind 127.0.0.1 --directory /opt/cvbootcamp33/old-site
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl start cvbootcamp33.service
touch /tmp/cvbootcamp33-ready
