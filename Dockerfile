FROM alpine:latest

RUN apk add --no-cache bash curl

COPY disk_space_check.sh /usr/local/bin/disk_space_check.sh

RUN chmod +x /usr/local/bin/disk_space_check.sh

ENTRYPOINT ["/usr/local/bin/disk_space_check.sh"]
