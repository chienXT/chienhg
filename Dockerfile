FROM php:8.2-apache

# 1. Cài đặt unzip (rất quan trọng!)
RUN apt-get update && apt-get install -y unzip

# 2. Copy file html.zip từ Git vào container
COPY html.zip /tmp/

# 3. Giải nén vào thư mục web của Apache
RUN unzip -o /tmp/html.zip -d /var/www/html/ \
    && rm /tmp/html.zip

# 4. Set quyền (nếu cần)
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
