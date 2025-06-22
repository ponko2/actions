# zizmor

## Usage

```yaml
name: Test
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
        uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v4.2.2
        with:
          persist-credentials: false
      - name: Run zizmor
        uses: ponko2/actions/zizmor@main
```
