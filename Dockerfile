FROM ubuntu:20.04 AS build

COPY hello.c /mnt/trini/

RUN apt update -qq \
&&  apt install -y gcc \
&&  gcc /mnt/trini/hello.c -o /mnt/trini/hello \
&&  rm /mnt/trini/hello.c

FROM ubuntu:20.04

COPY --from=build /mnt/trini/hello /usr/bin
