FROM node:18-slim

# 必要なツールのインストール
RUN apt-get update && apt-get install -y \
    curl \
    redis-server \
    couchdb \
    && apt-get clean

# 作業ディレクトリの設定
WORKDIR /app

# Budibase CLIのインストール
RUN npm install -g @budibase/cli

# エントリポイントスクリプトのコピーと実行権限の付与
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# ポートの公開
EXPOSE 10000

# エントリポイントの設定
ENTRYPOINT ["docker-entrypoint.sh"]
