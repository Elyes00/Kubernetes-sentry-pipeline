#!/bin/bash
kubectl run sentry-worker --image=sentry:9.0-onbuild --rm -i --tty \
--env="SENTRY_MEMCACHED_HOST=service-sentry-memcached" \
--env="SENTRY_REDIS_HOST=service-sentry-redis" \
--env="SENTRY_POSTGRES_HOST=service-sentry-pg" \
-- generate-secret-key