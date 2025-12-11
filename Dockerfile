FROM nginx:alpine
RUN apk add --no-cache unzip
COPY html.zip /tmp/

RUN cd /tmp && \
    unzip -o html.zip && \
    # Nếu có thư mục "website", "public", "dist", etc.
    mv website/* /usr/share/nginx/html/ 2>/dev/null || \
    mv public/* /usr/share/nginx/html/ 2>/dev/null || \
    mv dist/* /usr/share/nginx/html/ 2>/dev/null || \
    mv * /usr/share/nginx/html/

RUN rm -rf /tmp/html.zip
EXPOSE 80
