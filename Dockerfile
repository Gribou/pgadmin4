FROM dpage/pgadmin4 as pgadmin4


RUN user:root /pgadmin4 && \
    sed -i 's/5050/user/g' /etc/passwd && \
    sed -i 's/5050/user/g' /etc/group && \
    find / -user 5050 -exec chown user {} \; && \
    find / -group 5050 -exec chown :user {} \; && \
    sed 's@python /run_pgadmin.py@python /pgadmin4/run_pgadmin.py@g' /entrypoint.sh

USER user

VOLUME /var/lib/pgadmin
EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]
