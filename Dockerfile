FROM caddy:2.2.0-builder AS builder

RUN xcaddy build v2.2.0 \
	--with github.com/caddyserver/certmagic@latest
    --with github.com/caddy-dns/cloudflare@latest

FROM caddy:2.2.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy