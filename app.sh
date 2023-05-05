VERSION = "4.12.0"
apt install --yes --force-yes curl 
if [ -d "/app/coder/bin" ] 
then
    echo "Directory /app/bin exists." 
    PATH="/app/coder/bin:$PATH"
    code-server --config /app/coder/config &
    cat /app/coder/config/config.yml
else
    echo "Error: Directory /app/bin does not exists."
    mkdir -p /app/coder/lib /app/coder/bin
    curl -fL https://github.com/coder/code-server/releases/download/v$VERSION/code-server-$VERSION-linux-amd64.tar.gz \
      | tar -C /app/coder/lib -xz
    mv /app/coder/code-server-$VERSION-linux-amd64 /app/coder/lib/code-server-$VERSION
    ln -s /app/code-server-$VERSION/bin/code-server /app/bin/code-server
    PATH="/app/coder/bin:$PATH"
    code-server --config /app/coder/config &
    cat /app/coder/config/config.yml
fi
