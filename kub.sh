#!/bin/bash
kubectl run sentry-worker --image=elyes000/sentry:${DOCKER_TAG} --rm -i --tty \
--env="SENTRY_MEMCACHED_HOST=service-sentry-memcached" \
--env="SENTRY_REDIS_HOST=service-sentry-redis" \
--env="SENTRY_POSTGRES_HOST=service-sentry-pg" \
-- generate-secret-key
