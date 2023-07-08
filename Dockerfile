FROM golang:1.15-alpine AS builder

RUN mkdir /app

ADD . /app

WORKDIR /app

RUN go build -o /app/DckGo .

FROM scratch

WORKDIR /app
COPY --from=builder /app/DckGo ./DckGo

ENTRYPOINT [ "./DckGo" ]
