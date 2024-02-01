# vscode-cpp-cling

## Build the container with podman

```bash
cd ~/.local/src/vscode-cpp-cling
podman build -t computateorg/vscode-cpp-cling:latest .
```

## Test the container locally
```bash
podman run --rm -it computateorg/vscode-cpp-cling:latest /bin/bash
```

## Push the container up to quay.io
```bash
podman login quay.io
podman push computateorg/vscode-cpp-cling:latest quay.io/computateorg/vscode-cpp-cling:latest
```
