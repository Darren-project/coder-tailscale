FROM ghcr.io/darren-project/tailscale-docker:main
COPY app.sh /app.sh
RUN chmod +x /app.sh
