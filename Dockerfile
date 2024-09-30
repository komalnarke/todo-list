FROM python:3.12-alpine

RUN apk update && apk add --no-cache \
    build-base \
    python3-dev \
    py3-pip \
    musl-dev \
    libffi-dev \
    && pip install --upgrade pip \
    && pip install setuptools

WORKDIR /data

COPY . .


RUN pip install --no-cache-dir -r requirements.txt

RUN python manage.py migrate

EXPOSE 8000


CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

