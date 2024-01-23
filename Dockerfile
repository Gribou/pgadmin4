FROM ubuntu:latest

RUN apt-get update


RUN apt install pgadmin4

RUN adduser -S user  -G root
USER user
WORKDIR /home/user
CMD ["sh", "-c", "tail -f /dev/null"]
