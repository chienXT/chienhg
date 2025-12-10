FROM nginx:alpine

RUN apk add --no-cache unzip
COPY html.zip /tmp/

# GIẢI NÉN và DEBUG
RUN echo "=== DEBUG START ===" && \
    pwd && \
    ls -la /tmp/ && \
    echo "=== Unzipping ===" && \
    unzip -o /tmp/html.zip -d /usr/share/nginx/html/ && \
    echo "=== After unzip ===" && \
    ls -la /usr/share/nginx/html/ && \
    echo "=== File list ===" && \
    find /usr/share/nginx/html/ -type f | head -20 && \
    rm /tmp/html.zip && \
    echo "=== DEBUG END ==="

EXPOSE 80
