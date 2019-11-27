FROM memcached:latest
ENV MEMCACHED_SIZE 256M

COPY containers/memcached/entrypoint.sh /

RUN chmod +x /entrypoint.sh
USER memcache
ENTRYPOINT ["/entrypoint.sh"]
CMD ["memcached"]