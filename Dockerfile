FROM minio/minio:latest

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

HEALTHCHECK CMD mc ready local

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["minio", "server", "/data", "--console-address", ":9001"] 
