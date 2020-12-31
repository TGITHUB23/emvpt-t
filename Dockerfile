FROM alpine:latest

RUN apk add --no-cache gcc make pkgconfig pcsc-lite-dev openssl-dev rust cargo

COPY config /tmp/config
COPY emvpt /tmp/emvpt
COPY terminalsimulator /tmp/terminalsimulator
RUN cd /tmp/emvpt && cargo test && cd /tmp/terminalsimulator && cargo test
WORKDIR /tmp/terminalsimulator

ENTRYPOINT [ "cargo", "run", "--" ]