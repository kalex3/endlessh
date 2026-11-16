FROM alpine:3.24 as builder

COPY endlessh.c Makefile /

RUN apk add --no-cache build-base && make

FROM scratch

COPY --from=builder /endlessh /

EXPOSE 2222/tcp

USER 1000:1000

ENTRYPOINT ["/endlessh"]

CMD ["-v"]
