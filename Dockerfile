FROM caddy:2.4.3-alpine

WORKDIR /app

COPY Caddyfile .
COPY index.html .

CMD ["caddy", "run", "--config", "/app/Caddyfile"]