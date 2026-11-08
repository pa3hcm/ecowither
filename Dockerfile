FROM alpine:3.24

ENV PYTHONUNBUFFERED=1

COPY src/requirements.txt /tmp/requirements.txt

RUN apk --update --no-cache upgrade \
 && apk --no-cache add py3-pip \
 && pip install --no-cache-dir --break-system-packages -r /tmp/requirements.txt \
 && rm /tmp/requirements.txt \
 && adduser -D -H -u 10001 ecowither

COPY src/ /ecowither

EXPOSE 8088

USER 10001
WORKDIR /ecowither
ENTRYPOINT [ "python3", "ecowither.py" ]
