# Build stage
FROM golang:1.22 AS builder

# Set up environment for Go build
WORKDIR /app
COPY . .

# Compile the binary for Linux
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o notely

# Runtime stage
FROM debian:stable-slim

# Install required certificates
RUN apt-get update && apt-get install -y ca-certificates

# Copy the binary from the builder stage
COPY --from=builder /app/notely /usr/bin/notely

# Set execution permissions for the binary
RUN chmod +x /usr/bin/notely

# Set the default command
CMD ["notely"]
