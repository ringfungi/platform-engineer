# x86_64 build
FROM golang:alpine AS build
WORKDIR /app
COPY . .
RUN go build -o platform-engineer .

# ARM build
FROM golang:alpine AS build-arm
WORKDIR /app
COPY . .
RUN GOARCH=arm GOARM=7 go build -o platform-engineer-arm .

# Minimal golang alpine container to run the app
FROM golang:alpine

COPY --from=build /app/platform-engineer /app/platform-engineer
COPY --from=build-arm /app/platform-engineer-arm /app/platform-engineer-arm

ENV PORT=8080

EXPOSE $PORT

# Change the path to "/app/platform-engineer-arm" to run the ARM version
CMD ["/app/platform-engineer"]
