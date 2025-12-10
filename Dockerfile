FROM nginx:alpine

RUN apk add --no-cache unzip
COPY html.zip /tmp/

# CÁCH 1: Giải nén tất cả vào thư mục gốc
RUN unzip -o /tmp/html.zip && \
    mv * /usr/share/nginx/html/ 2>/dev/null || true

# CÁCH 2: Hoặc thử
RUN cd /tmp && \
    unzip -o html.zip && \
    cp -r * /usr/share/nginx/html/ 2>/dev/null || true

# CÁCH 3: Hoặc tìm file index.*
RUN cd /tmp && \
    unzip -o html.zip && \
    find . -name "index.*" -exec cp --parents {} /usr/share/nginx/html/ \;

RUN rm -f /tmp/html.zip

EXPOSE 80
