# Homelab

## よさげな奴

- miniflux
- wallabag
- wordpress
- grafana

```bash
cd ./v4/
sudo docker compose up -d
sudo docker exec -it nextcloud /bin/bash -c "sh /root/setup.sh"
sudo docker exec -it ollama /bin/bash -c "sh /root/ollama/setup.sh"
# sudo cp ./cockpit/cockpit.conf /etc/cockpit/cockpit.conf && sudo systemctl restart cockpit
```
