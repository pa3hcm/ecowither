FROM alpine:3.15

RUN apk --update --no-cache add py3-pip \
 && pip install --no-cache-dir influxdb-client \
 && pip install --no-cache-dir flask \
 && mkdir /ecowither

COPY src/ /ecowither

EXPOSE 8088

WORKDIR /ecowither
ENTRYPOINT [ "python3", "ecowither.py" ]
