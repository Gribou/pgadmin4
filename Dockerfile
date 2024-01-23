FROM dpage/pgadmin4:latest

USER 0
RUN setcap -r /usr/bin/python*
USER pgadmin
