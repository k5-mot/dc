FROM docker.io/node:18-alpine AS deps

WORKDIR /app

# Rebuild the source code only when needed
FROM docker.io/node:18-alpine AS builder
WORKDIR /app

RUN apk add git && \
    apk add libc6-compat && \
    apk add --virtual .gyp python3 make g++ && \
    npm install -g pnpm

RUN git clone https://github.com/benphelps/homepage.git .

ARG BUILDTIME
ARG VERSION
ARG REVISION

# All this work just to change this file before it builds :)
COPY ./next.config.js ./next.config.js
COPY ./config ./config

RUN npm install -g next
RUN npm install --save-dev eslint

RUN npm run build

# Production image, copy all the files and run next
FROM docker.io/node:18-alpine AS runner

ENV NODE_ENV production

WORKDIR /app

# Copy files from builder
COPY --from=builder /app/package.json /app/next.config.js ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static/ ./.next/static/

ENV PORT 3000
EXPOSE $PORT

HEALTHCHECK --interval=10s --timeout=3s --start-period=20s \
  CMD wget --no-verbose --tries=1 --spider --no-check-certificate http://localhost:$PORT/api/healthcheck || exit 1

CMD ["node", "server.js"]
