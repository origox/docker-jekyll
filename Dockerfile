FROM alpine

RUN apk add --no-cache --update \
    git \
    libffi-dev \ 
    libffi \
    ruby-dev \
    ruby \
    gcc \
    libc-dev \
    zlib-dev \
    zlib \
    make

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN yes | gem update --system

COPY ./Gemfile /

RUN gem install bundler

RUN bundle install

WORKDIR /srv/jekyll

EXPOSE 4000

# Set host to avoid the default 127.0.0.1 that requires use of ssh tunnel
CMD bundle exec jekyll serve --host=0.0.0.0 --watch --incremental