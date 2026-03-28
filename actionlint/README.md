# actionlint

## Usage

```yaml
name: CI
on:
  pull_request: {}
  push:
    branches: [main]
permissions: {}
jobs:
  actionlint:
    name: actionlint
    runs-on: ubuntu-latest
    timeout-minutes: 5
    permissions:
      contents: read
    steps:
      - name: Checkout
        uses: actions/checkout@de0fac2e4500dabe0009e67214ff5f5447ce83dd # v6.0.2
        with:
          persist-credentials: false
      - name: Run actionlint
        uses: ponko2/actions/actionlint@main
```
