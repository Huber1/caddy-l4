FROM caddy:builder AS builder

WORKDIR /build

RUN git clone https://github.com/mholt/caddy-l4.git

WORKDIR /build/caddy-l4

RUN xcaddy build

FROM caddy:latest

COPY --from=builder /build/caddy-l4/caddy /usr/bin/caddy

