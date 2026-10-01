FROM dunglas/frankenphp:php8.3

WORKDIR /app

# Optional PHP extensions commonly useful for development
RUN install-php-extensions \
    pdo_mysql \
    opcache

# FrankenPHP's default Caddy configuration serves /app/public.
# We'll override the document root below.
