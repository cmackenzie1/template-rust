# syntax=docker/dockerfile:1
ARG NAME=template-rust

FROM rust:1.99-trixie AS builder
ARG NAME
WORKDIR /src

COPY . .
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/src/target \
    cargo build --release --locked -p ${NAME} \
    && cp target/release/${NAME} /out-bin

FROM debian:trixie-slim
ARG NAME
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --system --uid 10001 --no-create-home app

COPY --from=builder /out-bin /usr/local/bin/${NAME}
USER 10001:10001
# Exec form doesn't expand ARGs; keep this in sync with NAME.
ENTRYPOINT ["/usr/local/bin/template-rust"]
