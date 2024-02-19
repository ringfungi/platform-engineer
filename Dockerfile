# x86_64 build
FROM golang:alpine AS build
WORKDIR /app
COPY . .
RUN go build -o platform-engineer-x86_64 .

# ARM build
FROM golang:alpine AS build-arm
WORKDIR /app
COPY . .
RUN GOARCH=arm GOARM=7 go build -o platform-engineer-arm .

# Minimal golang alpine container to run the app
FROM golang:alpine

COPY --from=build /app/platform-engineer-x86_64 /app/platform-engineer-x86_64
COPY --from=build-arm /app/platform-engineer-arm /app/platform-engineer-arm

ENV PORT=8080

EXPOSE $PORT

# Run the app based on the architecture
CMD ["/bin/sh", "-c", "if [ \"$ARCH\" = \"arm\" ]; then /app/platform-engineer-arm; else /app/platform-engineer-x86_64; fi"]
