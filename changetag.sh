#!/bin/bash
sed "s/tagVersion/$1/g" memcached.yml > memcached.yml
sed "s/tagVersion/$1/g" nginx.yml > nginx.yml
sed "s/tagVersion/$1/g" sentry-web.yml > sentry-web.yml