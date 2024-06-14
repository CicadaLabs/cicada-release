# Cicada Wallet

Hello! This is an early-alpha version (v0.2).

It is connected to testnet (Bitcoin) / stagenet (Monero) networks,
and allows to accept the coins there and basic concepts used in Cicada.

This demo may require a little bit tinkering or technical skills to run.

Feel free to ask questions or report issues at [frantisek@cicadalabs.io](mailto:frantisek@cicadalabs.io).

## Requirements

- Docker (https://docs.docker.com/get-docker/)

We have tested the stack on Linux (Debian) and macOS. 

## How to run

1. Clone the repository (or download the zip file and extract it)
2. Create the `ENCRYPTION_KEY` for the wallet
3. Run the wallet

```shell
git clone https://github.com/CicadaLabs/cicada-release.git
cd cicada-release
docker compose up -d cli
echo "ENCRYPTION_KEY=$(docker compose exec cli /app/infra/scripts/generate-encryption-key.sh)" >> .env
docker compose up -d
```

Wait few minutes so all services are started!

Open [http://localhost:8080](http://localhost:8080)
