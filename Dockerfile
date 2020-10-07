FROM caddy:builder AS builder

RUN xcaddy build v2.2.0 \
    --with github.com/caddy-dns/cloudflare@latest

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy