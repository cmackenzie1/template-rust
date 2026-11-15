name := "template-rust"

default:
    @just --list

fmt:
    cargo +nightly fmt --all

build:
    cargo build --release -p {{name}}

lint:
    cargo clippy --workspace --all-targets -- -D warnings

run:
    cargo run -p {{name}}

test:
    cargo test --workspace

image:
    docker build --build-arg NAME={{name}} -t {{name}} .
