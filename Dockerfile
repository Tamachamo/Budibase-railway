FROM node:18-slim

# Budibase CLIをインストール
RUN npm install -g @budibase/cli

# 作業ディレクトリ
WORKDIR /app

# Entrypointスクリプトを追加
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# ポート公開
EXPOSE 10000

# Entrypointをフルパスで指定
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]