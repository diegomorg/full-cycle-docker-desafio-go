FROM golang:1.22.5-alpine as builder

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o desafio-go

FROM scratch
COPY --from=builder /app/desafio-go /

ENTRYPOINT [ "/desafio-go" ]
