FROM python:3.8.5-alpine
RUN apk add gcc python3-dev openssl-dev
RUN apk add libressl-dev musl-dev libffi-dev
RUN pip install cryptography==2.1.4
RUN apk del libressl-dev \
        musl-dev \
        libffi-dev

COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

ENTRYPOINT ["python"]
CMD ["rest.py"]
