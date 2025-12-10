FROM php:8.2-cli

WORKDIR /app

COPY . .

# Giải nén file ZIP
RUN unzip -o html.zip && rm html.zip

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/app"]
