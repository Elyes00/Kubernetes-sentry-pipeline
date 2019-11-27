FROM sentry:9.0-onbuild

WORKDIR /var/lib/sentry/files

ENV PYTHONPATH /var/lib/sentry/files

COPY . /var/lib/sentry/files

RUN if [ -s requirements.txt ]; then pip install -r requirements.txt; fi

RUN if [ -s sentry-setup.py ]; then pip install -e .; fi
