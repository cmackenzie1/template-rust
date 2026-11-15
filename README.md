# template-rust

Minimal Rust workspace template.

- `crates/` – workspace members (`crates/*` is auto-included)
- `crates/template-rust` – example binary
- `Dockerfile` – multi-stage build (Debian trixie)
- `justfile` – `fmt`, `lint`, `build`, `test`, `run`, `image`
- `.github/` – CI and weekly Dependabot

After using this template, rename the crate directory and `name` in its `Cargo.toml`, and update `name` in `justfile`, and `NAME` and `ENTRYPOINT` in the Dockerfile.
