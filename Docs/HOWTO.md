# Installing/Building

The following instructions were obtained from the official Docker website [here](https://docs.docker.com/engine/install/ubuntu/)
## Remove Old Docker
Firstly, make sure you have the most recent version of Docker (or other OCI Container Manager such as Podman)

## Install New Docker

### Using apt

1. Copy-Paste the following to setup the new apt repos:
```
    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
```

2. Copy-Paste the following to install the latest Docker version:
```
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

3. Test by entering the following:
```
    sudo docker run hello-world
```

### Using dpkg


