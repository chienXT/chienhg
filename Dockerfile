FROM nginx:alpine

# Cài unzip trước
RUN apk add --no-cache unzip

# Copy file zip từ context build (từ máy bạn)
COPY html.zip /tmp/

# Giải nén vào đúng thư mục
RUN unzip -o /tmp/html.zip -d /usr/share/nginx/html/ \
    && rm /tmp/html.zip
