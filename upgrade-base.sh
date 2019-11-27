#!/bin/bash

kubectl run sentry-worker --image=sentry:9.0-onbuild --rm -i --tty \
--env="SENTRY_MEMCACHED_HOST=staging-sentry-memcached" \
--env="SENTRY_REDIS_HOST=staging-service-sentry-redis" \
--env="SENTRY_POSTGRES_HOST=staging-service-sentry-pg" \
--env="SENTRY_SECRET_KEY=$(kubectl get secret sentry-secret -o=jsonpath="{.data['sentry_secret_key']}" | base64 --decode)" \
-- upgrade