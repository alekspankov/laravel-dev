FROM webdevops/php-nginx-dev:8.2

ARG TARGETPLATFORM

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl software-properties-common && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    apt-get install -y \
        git \
        zip \
        curl \
        sudo \
        unzip \
        libicu-dev \
        libbz2-dev \
        libpng-dev \
        libjpeg-dev \
        libmcrypt-dev \
        libreadline-dev \
        libfreetype6-dev \
        libzip-dev \
        libonig-dev \
        g++ \
        nodejs \
        poppler-utils && \
    rm -rf /var/lib/apt/lists/*s 
    # && \
RUN install-php-extensions \
        http \
        bz2 \
        intl \
        bcmath \
        opcache \
        calendar \
        pdo_mysql \
        zip \
        @composer 

        # && \
# RUN docker-service-enable cron

ENV PHP_MEMORY_LIMIT=256M
ENV PHP_MAX_EXECUTION_TIME=300
ENV PHP_POST_MAX_SIZE=20M
ENV PHP_UPLOAD_MAX_FILESIZE=20M

ENV WEB_DOCUMENT_ROOT=/app/public
ENV WEB_DOCUMENT_INDEX=index.php

ENV PHP_DEBUGGER=xdebug
ENV XDEBUG_MODE=debug
ENV XDEBUG_START_WITH_REQUEST=yes
ENV XDEBUG_CLIENT_HOST="host.docker.internal"
ENV XDEBUG_CLIENT_PORT=9003
ENV XDEBUG_IDE_KEY=docker
ENV XDEBUG_SESSION=docker

WORKDIR /app

RUN echo "${TARGETPLATFORM}" && \
    if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
        echo "M1" && \
        wget -O "/usr/local/bin/go-replace" "https://github.com/webdevops/goreplace/releases/download/1.1.2/gr-arm64-linux" \
            && chmod +x "/usr/local/bin/go-replace" \
            && "/usr/local/bin/go-replace" --version ; \
    fi 

ENV ARCH=${TARGETPLATFORM}
    
EXPOSE 80