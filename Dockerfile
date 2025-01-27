FROM golang:1.20 as builder
WORKDIR /app
COPY . .
RUN go build -o app

FROM alpine:3.17
WORKDIR /app
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]
