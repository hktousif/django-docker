FROM python:3.9
ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt
COPY ./app /app
COPY ./scripts /scripts
WORKDIR /app
EXPOSE 8000
RUN python -m venv /django_env && \
    /django_env/bin/pip install --upgrade pip && \
    # apk add --update --no-cache postgresql-client && \
    # apk add --update --no-cache --vertual .tmp.deps \
    #     build-base postgresql-dev musl-dev && \
    /django_env/bin/pip install -r /requirements.txt && \
    # apk del .tmp-deps && \
    adduser --disabled-password --no-create-home app && \
    mkdir -p /vol/web/static && \
    mkdir -p /vol/web/media && \
    chown -R app:app /vol && \
    chown -R 755 /vol && \
    chmod -R +x /scripts && \
    chmod -R +x manage.py

ENV PATH="/scripts:/django_env/bin:$PATH"

# USER app

CMD ["run.sh"]