apt install --yes --force-yes curl 
if [ -d "/app/" ] 
then
    echo "Directory /app/ exists." 
    PATH="/app/bin:$PATH"
    code-server --config /app/config &
    cat /app/config/config.yml
else
    echo "Error: Directory /app/ does not exists."
    mkdir -p /app/lib /app/bin
    curl -fL https://github.com/coder/code-server/releases/download/v$VERSION/code-server-$VERSION-linux-amd64.tar.gz \
      | tar -C /app/lib -xz
    mv /app/code-server-$VERSION-linux-amd64 /app/lib/code-server-$VERSION
    ln -s /app/code-server-$VERSION/bin/code-server /app/bin/code-server
    PATH="/app/bin:$PATH"
    code-server --config /app/config &
    cat /app/config/config.yml
fi
