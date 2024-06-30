# ステージ1: 依存関係のインストールとビルド
FROM node:18 AS builder
WORKDIR /usr/src/app

# pnpmのインストール
RUN npm install -g pnpm

# package.jsonとpnpm-lock.yamlをコピー
COPY package.json pnpm-lock.yaml ./

# 依存関係のインストール
RUN pnpm install

# Prismaクライアントの生成
COPY prisma ./prisma/
RUN npx prisma generate

# アプリケーションのソースコードをコピー
COPY src ./src/
COPY . .

# アプリケーションのビルド
RUN pnpm run build

# ステージ2: 本番環境用イメージの作成
FROM node:18-alpine AS production
WORKDIR /usr/src/app

# 環境変数 NODE_ENV を production に設定
ENV NODE_ENV=production

# pnpmのインストール
RUN npm install -g pnpm

# package.jsonとpnpm-lock.yamlをコピー
COPY package.json pnpm-lock.yaml ./

# 本番依存関係のみをインストール
RUN pnpm install

# ビルドしたファイルをコピー
COPY --from=builder /usr/src/app/dist ./dist
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app/prisma ./prisma
COPY --from=builder /usr/src/app/src ./src

# アプリケーションがリッスンするポート番号
EXPOSE 8080

CMD ["node", "dist/src/main"]
