FROM ubuntu:latest

RUN apt-get update
RUN apt install -y ca-certificates
RUN sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/jammy pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'
RUN apt-get --allow-insecure-repositories -y update
RUN apt-get --allow-unauthenticated -y install pgadmin4
RUN adduser user root
USER user
WORKDIR /home/user
CMD ["sh", "-c", "tail -f /dev/null"]
