FROM node:18

# Budibase CLIをグローバルにインストール
RUN npm install -g @budibase/cli

# 作業ディレクトリ
WORKDIR /app

# Entrypointスクリプトをコピー
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Budibase CLIのある場所を明示的にPATHに追加（安全策）
ENV PATH="/usr/local/bin:${PATH}"

# 公開ポート
EXPOSE 10000

# Entrypoint設定（フルパス）
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]