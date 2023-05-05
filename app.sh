apt install --yes --force-yes curl 
if [ -d "/data/" ] 
then
    echo "Directory /data/ exists." 
else
    echo "Error: Directory /data/ does not exists."
    mkdir -p /data/lib /data/bin
    curl -fL https://github.com/coder/code-server/releases/download/v$VERSION/code-server-$VERSION-linux-amd64.tar.gz \
      | tar -C /data/lib -xz
    mv /data/code-server-$VERSION-linux-amd64 /data/lib/code-server-$VERSION
    ln -s /data/code-server-$VERSION/bin/code-server /data/bin/code-server
    PATH="/data/bin:$PATH"
    code-server --config /data/config &
    cat /data/config/config.yml
fi
