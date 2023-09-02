FROM golang as builder

WORKDIR /app

ENV CGO_ENABLED=0
ENV GOOS=linux

COPY . .
RUN go mod download
RUN go build -o ./desafio-go

FROM scratch

WORKDIR /app
COPY --from=builder /app/desafio-go .

ENTRYPOINT [ "/app/desafio-go" ]