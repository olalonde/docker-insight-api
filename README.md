docker-insight-api
==================

Dockerfile for insight-api. See https://github.com/bitpay/insight-api

# Usage

```
docker build -t insight .
docker run -p 3000:3000 -v ~/.bitcoin:/data/bitcoin insight
```
