#!/bin/bash
kubectl get secret sentry-secret -o=jsonpath="{.data['sentry_secret_key']}" | base64 —-decode