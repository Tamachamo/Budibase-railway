FROM node:18-slim

# Budibase CLIのインストール
RUN npm install -g @budibase/cli

# 作業ディレクトリ
WORKDIR /app

# Entrypointスクリプトをコピー
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# ポート公開
EXPOSE 10000

# Entrypoint設定
ENTRYPOINT ["docker-entrypoint.sh"]
