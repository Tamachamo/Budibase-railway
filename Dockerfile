FROM debian:bullseye-slim

# 環境変数
ENV DEBIAN_FRONTEND=noninteractive

# 必要なツール・Budibase CLIをインストール
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    redis-server \
    couchdb \
    nodejs \
    npm \
    && apt-get clean

# Budibase CLI インストール
RUN npm install -g @budibase/cli

# 作業ディレクトリ
WORKDIR /app

# Entrypointスクリプトをコピー
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 10000

ENTRYPOINT ["docker-entrypoint.sh"]
