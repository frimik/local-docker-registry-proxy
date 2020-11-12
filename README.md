# local-docker-registry-proxy

Proxies Quay.io and Docker.io registries. All you need is to `mkcert "*.local"` and place the certificate
files in [the proper place](services/traefik/certs) according to the filenames dictated by [config.toml](services/traefik/traefik/dynamic/config.toml)

![Screenshot](screenshot.png)

## k3d

```sh
k3d cluster create \
    --servers 1 \
    --agents 1 \
    --k3s-server-arg='--no-deploy=traefik' \
    --volume "${HOME}/dev/local-docker-registry-proxy/registries.yaml:/etc/rancher/k3s/registries.yaml" \
    --volume "${HOME}/.local/share/mkcert/rootCA.pem:/etc/ssl/certs/Registry_Root_CA.pem" \
    --wait \
    --network k3d-backend
```
