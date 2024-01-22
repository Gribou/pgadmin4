FROM dpage/pgadmin4 as pgadmin4
RUN adduser -S user  -G root 
RUN chown user:root /pgadmin4 && \
    sed -i 's/5050/1000720000/g' /etc/passwd && \
    sed -i 's/5050/1000720000/g' /etc/group && \
    find / -user 5050 -exec chown 1000720000 {} \; && \
    find / -group 5050 -exec chown :1000720000 {} \; && \
    sed 's@python /run_pgadmin.py@python /pgadmin4/run_pgadmin.py@g' /entrypoint.sh

USER user

VOLUME /var/lib/pgadmin
EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]
