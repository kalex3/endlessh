FROM alpine:3.24 AS builder

RUN apk add --no-cache build-base

COPY endlessh.c Makefile /

RUN make

FROM scratch

COPY --from=builder /endlessh /

EXPOSE 2222/tcp

USER 1000:1000

ENTRYPOINT ["/endlessh"]

CMD ["-v"]
