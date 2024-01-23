FROM dpage/pgadmin4 as pgadmin4
RUN adduser -S user  -G root

USER root

RUN chown -R user /pgadmin4 && \
    
    sed 's@python /run_pgadmin.py@python /pgadmin4/run_pgadmin.py@g' /entrypoint.sh

VOLUME /var/lib/pgadmin
EXPOSE 8080 

ENTRYPOINT ["/entrypoint.sh"]
