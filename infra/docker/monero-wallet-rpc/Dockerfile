FROM debian:stable-slim as download

ARG TARGETPLATFORM

RUN apt update && apt install -y lbzip2 curl gpg

WORKDIR /monero
COPY ./infra/docker/monero-wallet-rpc/fetch_script.sh fetch_script.sh
RUN bash fetch_script.sh ${TARGETPLATFORM}


FROM debian:stable-slim

WORKDIR /monero
COPY --from=download /monero/monero-wallet-rpc monero-wallet-rpc

WORKDIR /
RUN useradd -ms /bin/bash monero
COPY --chown=monero:monero ./infra/docker/monero-wallet-rpc/entrypoint.sh entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /monero/wallet
RUN chown monero:monero -R /monero

USER monero:monero

EXPOSE 18081

ENTRYPOINT ["/entrypoint.sh"]
