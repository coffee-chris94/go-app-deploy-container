FROM golang:1.23 as builder

# Set the working directory
WORKDIR /app

# Clone the go-app repository (use your public/private URL)
RUN git clone https://github.com/coffee-chris94/go-app.git .

# Build the Go app
RUN go build -o app .

FROM alpine:3.17

# Set the working directory in the final image
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/app .

# Expose the port the Go app will run on
EXPOSE 8080

# Run the binary
CMD ["./app"]

