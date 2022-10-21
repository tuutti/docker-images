ARG BASE_IMAGE_TAG
FROM php:${BASE_IMAGE_TAG} as base

# Install required tools
RUN apk add --no-cache \
    sqlite \
    sqlite-dev \
    git \
    patch \
    mariadb-client \
    chromium \
    chromium-chromedriver \
    # druidfi/tools has dependency to make and
    # 'make cast-spell' has dependency to bash
    make \
    bash \
    jq \
    gnupg \
    coreutils

# install the PHP extensions we need
RUN set -eux; \
	\
	apk add --no-cache --virtual .build-deps \
		coreutils \
		freetype-dev \
		libjpeg-turbo-dev \
		libpng-dev \
		libzip-dev \
    autoconf \
    g++ \
    libtool \
	; \
	\
  pecl install apcu pcov; \
  \
	docker-php-ext-configure gd \
		--with-freetype \
		--with-jpeg=/usr/include \
	; \
	\
  docker-php-ext-enable apcu.so pcov.so; \
  \
	docker-php-ext-install -j "$(nproc)" \
    sockets \
		gd \
		opcache \
    bcmath \
		pdo_mysql \
		zip \
    pdo_sqlite \
	; \
	\
	runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)"; \
	apk add --virtual .drupal-phpexts-rundeps $runDeps; \
	apk del .build-deps; \
  rm /usr/local/bin/phpdbg \
    /usr/local/bin/php-cgi

# We can't remove files from base layer (php container) so we have to copy everything
# into a new layer to not to waste space.
FROM scratch
COPY --from=base / /

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

# override memory limit and upload max filesize and post max size
# to enable bigger uploads
RUN { \
		echo 'memory_limit=512M'; \
		echo 'upload_max_filesize=32M'; \
		echo 'post_max_size=32M'; \
	} > /usr/local/etc/php/conf.d/php-overrides.ini

ENV GH_SHA256SUM 3db79714805262011b2dd65235ed602c0f931248297b0e5f2b25fcf88a1a2757
RUN \
  curl -fSL -o gh.tar.gz "https://github.com/cli/cli/releases/download/v2.8.0/gh_2.8.0_linux_amd64.tar.gz"; \
  echo "$GH_SHA256SUM *gh.tar.gz" | sha256sum -c - ; \
  tar -zxvf gh.tar.gz; \
  mv gh_2.8.0_linux_amd64/bin/gh /usr/bin/gh; \
  chmod +x /usr/bin/gh; \
  rm -rf gh_2.8.0_linux_amd64/; \
  rm gh.tar.gz

# Install Composer
COPY --from=composer:2.3 /usr/bin/composer /usr/local/bin/

ENV COMPOSER_HOME=/tmp/.composer

# Install drush launcher
ENV DRUSH_LAUNCHER_SHA256SUM=d466e4268dcb2f3465feeb01518d2770c4be8ca533e010b678799bbd14dd90c5
ENV BOX_REQUIREMENT_CHECKER=0
RUN \
  curl -fSL -o drush "https://github.com/drush-ops/drush-launcher/releases/download/0.10.0/drush.phar" && \
  echo "${DRUSH_LAUNCHER_SHA256SUM} *drush" | sha256sum -c - && \
  chmod +x drush && \
  mv drush /usr/local/bin

RUN curl https://keybase.io/codecovsecurity/pgp_keys.asc | gpg --no-default-keyring --keyring trustedkeys.gpg --import; \
  curl -Os https://uploader.codecov.io/latest/alpine/codecov; \
  curl -Os https://uploader.codecov.io/latest/alpine/codecov.SHA256SUM; \
  curl -Os https://uploader.codecov.io/latest/alpine/codecov.SHA256SUM.sig; \
  gpgv codecov.SHA256SUM.sig codecov.SHA256SUM; \
  sha256sum -c codecov.SHA256SUM; \
  rm codecov.*; \
  chmod +x codecov; \
  mv codecov /usr/bin/;

USER 1001
