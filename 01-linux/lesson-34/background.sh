#!/usr/bin/env bash
set -euo pipefail
mkdir -p /opt/cvbootcamp34/models /opt/cvbootcamp34/logs
printf 'demo-weights\n' >/opt/cvbootcamp34/models/model.bin
cat >/opt/cvbootcamp34/app.py <<'PY'
import json
import os
from http.server import BaseHTTPRequestHandler, HTTPServer
from pathlib import Path
class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path != "/health":
            self.send_error(404)
            return
        model_path = Path(os.environ.get("CV_MODEL_PATH", "models/model.bin"))
        ready = model_path.is_file() and model_path.stat().st_size > 0
        payload = json.dumps({"status": "ready" if ready else "not_ready", "model": str(model_path)}).encode()
        self.send_response(200 if ready else 503)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(payload)))
        self.end_headers()
        self.wfile.write(payload)
HTTPServer(("127.0.0.1", 8874), Handler).serve_forever()
PY
chmod -R a+rX /opt/cvbootcamp34
cat >/etc/systemd/system/cvbootcamp34.service <<'EOF'
[Unit]
Description=CV Bootcamp mini inference simulation
After=network.target

[Service]
Type=simple
User=nobody
WorkingDirectory=/opt/cvbootcamp34/logs
Environment=CV_MODEL_PATH=models/model.bin
ExecStart=/usr/bin/python3 /opt/cvbootcamp34/app.py
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl start cvbootcamp34.service
touch /tmp/cvbootcamp34-ready
