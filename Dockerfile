FROM ruby:2.3

ENV PHANTOM_VERSION 2.1.1
ENV NODE_VERSION 8

# Install phantomjs
RUN \
    set -x  \
 && mkdir /tmp/phantomjs \
 && curl -sL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOM_VERSION}-linux-x86_64.tar.bz2 \
        | tar -xj --strip-components=1 -C /tmp/phantomjs \
 && mv /tmp/phantomjs/bin/phantomjs /usr/local/bin \
 && rm -rf /tmp/phantomjs \
 && chmod +w /usr/local/bin/phantomjs

# Install node and yarn
RUN \
    curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
 && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
 && apt-get update \
 && apt-get install -y nodejs yarn \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 3000
