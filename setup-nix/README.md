# setup-nix

## Usage

```yaml
name: CI
on:
  pull_request: {}
  push:
    branches: [main]
permissions: {}
jobs:
  nixfmt:
    name: Nixfmt
    runs-on: ubuntu-latest
    timeout-minutes: 5
    permissions:
      contents: read
    steps:
      - name: Checkout
        uses: actions/checkout@de0fac2e4500dabe0009e67214ff5f5447ce83dd # v6.0.2
        with:
          persist-credentials: false
      - name: Set up Nix
        uses: ponko2/actions/setup-nix@main
        with:
          cachix-auth-token: ${{ secrets.CACHIX_AUTH_TOKEN }}
          prefetch-dependencies: false
      - name: Run Nixfmt
        run: nix fmt -- --ci
```
