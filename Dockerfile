FROM node:18

# Budibase CLIのインストール
RUN npm install -g @budibase/cli

# 作業ディレクトリ
WORKDIR /app

# Entrypointスクリプトの配置と権限
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# 安全策として PATH を明示
ENV PATH="/usr/local/bin:/usr/local/lib/node_modules/@budibase/cli/bin:${PATH}"

EXPOSE 10000

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]