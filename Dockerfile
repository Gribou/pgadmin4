FROM ubuntu:latest

RUN apt-get update
RUN apt install -y ca-certificates
RUN sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/jammy/dists/pgadmin4 pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

RUN apt list --upgradable

RUN apt install pgadmin4
RUN adduser -S user  -G root
USER user
WORKDIR /home/user
CMD ["sh", "-c", "tail -f /dev/null"]
