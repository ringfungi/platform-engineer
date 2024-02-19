# Minimal base image
FROM golang:1.21.6-alpine

WORKDIR /app

# Copy Go modules and dependencies to the image
COPY go.mod ./

# Download Go modules and dependencies
RUN go mod download

# Copy all the Go files
COPY *.go ./

# Compile app
RUN go build -o /platform-engineer

# Default network port
ENV PORT=8080

EXPOSE $PORT

CMD [ "/platform-engineer" ]
