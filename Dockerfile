# Stage 1: Build the Go binary
FROM golang:1.20-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o main

# Stage 2: Minimal final image
FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]
