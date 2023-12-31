FROM alpine:3.19

RUN apk --update --no-cache add py3-pip \
 && pip install --no-cache-dir influxdb-client flask --break-system-packages \
 && mkdir /ecowither

COPY src/ /ecowither

EXPOSE 8088

WORKDIR /ecowither
ENTRYPOINT [ "python3", "ecowither.py" ]
