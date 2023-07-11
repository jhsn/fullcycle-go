FROM golang:1.17-alpine AS build

WORKDIR /app
COPY . .
RUN go build -o main hello.go

FROM scratch
WORKDIR /app
COPY --from=build /app/main .

CMD ["/app/main"]
