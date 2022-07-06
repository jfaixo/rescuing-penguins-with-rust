FROM node:16 AS build-env
COPY . /app
WORKDIR /app

RUN yarn install --frozen-lockfile

FROM gcr.io/distroless/nodejs:16
COPY --from=build-env /app /app
WORKDIR /app

EXPOSE 3000

CMD ["index.js"]