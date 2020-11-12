# local-docker-registry-proxy

Proxies Quay.io and Docker.io registries. All you need is to `mkcert "*.local"` and place the certificate
files in [the proper place](services/traefik/certs) according to the filenames dictated by [config.toml](services/traefik/traefik/dynamic/config.toml)

![Screenshot](screenshot.png)

## Usage

```sh
docker-compose up
```

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

## Links

- http://localhost:3000 - Grafana
- http://localhost:9090 - Prometheus
- http://localhost:8080 - Traefik
- http://localhost:8000/registry/quayio/metrics - Prometheus metrics endpoint of `registry-quayio` instance.
- http://localhost:8000/registry/dockerio/metrics - Prometheus metrics endpoint of `registry-dockerio` instance.
