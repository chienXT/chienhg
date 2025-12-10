FROM nginx:alpine

# 1. Cài unzip
RUN apk add --no-cache unzip

# 2. Copy file zip
COPY html.zip /tmp/

# 3. Tạo thư mục web (xóa nội dung cũ trước)
RUN rm -rf /usr/share/nginx/html/*

# 4. Giải nén VÀ DI CHUYỂN TẤT CẢ
RUN cd /tmp && \
    unzip -o html.zip && \
    # Di chuyển mọi thứ vào thư mục web
    shopt -s dotglob && \
    mv * /usr/share/nginx/html/ 2>/dev/null || true && \
    # Hoặc nếu có thư mục con
    mv */ /usr/share/nginx/html/ 2>/dev/null || true

# 5. Xóa file zip
RUN rm -f /tmp/html.zip

# 6. KIỂM TRA (quan trọng)
RUN echo "=== DANH SÁCH FILE ===" && \
    ls -la /usr/share/nginx/html/ && \
    echo "=== TÌM FILE index.* ===" && \
    find /usr/share/nginx/html/ -name "index.*" -type f

EXPOSE 80
