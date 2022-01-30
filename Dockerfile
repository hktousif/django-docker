FROM python:3.9
ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000
RUN python -m venv /django_env && \
    /django_env/bin/pip install --upgrade pip && \
    # apk add --update --no-cache postgresql-client && \
    # apk add --update --no-cache --vertual .tmp.deps \
    #     build-base postgresql-dev musl-dev && \
    /django_env/bin/pip install -r /requirements.txt && \
    # apk del .tmp-deps && \
    adduser --disabled-password --no-create-home django_user
ENV PATH="/django_env/bin/:$PATH"
USER django_user