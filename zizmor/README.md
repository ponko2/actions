# zizmor

## Usage

```yaml
name: CI
on:
  pull_request: {}
  push:
    branches: [main]
permissions: {}
jobs:
  zizmor:
    name: zizmor
    runs-on: ubuntu-latest
    timeout-minutes: 5
    permissions:
      contents: read
    steps:
      - name: Checkout
        uses: actions/checkout@de0fac2e4500dabe0009e67214ff5f5447ce83dd # v6.0.2
        with:
          persist-credentials: false
      - name: Run zizmor
        uses: ponko2/actions/zizmor@main
```
