#!/bin/bash
VERSION="4.12.0"
apt install --yes --force-yes curl 
if [ -d "/app/coder2/bin/" ] 
then
    echo "Directory /app/coder2/bin exists." 
    PATH="/app/coder2/bin:$PATH"
    code-server --config /app/coder2/config
else
    echo "Error: Directory /app/coder2/bin does not exists."
    mkdir -p /app/coder2/lib /app/coder2/bin
    echo https://github.com/coder/code-server/releases/download/v$VERSION/code-server-$VERSION-linux-amd64.tar.gz
    curl -fL https://github.com/coder/code-server/releases/download/v$VERSION/code-server-$VERSION-linux-amd64.tar.gz \
      | tar -C /app/coder2/lib -xz
    mv /app/coder2/lib/code-server-$VERSION-linux-amd64 /app/coder2/code-server-$VERSION
    ln -s /app/coder2/code-server-$VERSION/bin/code-server /app/coder2/bin/code-server
    PATH="/app/coder2/bin:$PATH"
    code-server --config /app/coder2/config
