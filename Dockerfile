FROM dpage/pgadmin4 as pgadmin4

USER root 
RUN apk add --update --no-cache sudo
RUN chown 1000780000:1000780000 /pgadmin4 && \
    sed -i 's/5050/1000780000/g' /etc/passwd && \
    sed -i 's/5050/1000780000/g' /etc/group && \
    find / -user 5050 -exec chown 1000780000 {} \; && \
    find / -group 5050 -exec chown :1000780000 {} \; && \
    sed 's@python /run_pgadmin.py@python /pgadmin4/run_pgadmin.py@g' /entrypoint.sh

USER 1000780000

VOLUME /var/lib/pgadmin
EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]
