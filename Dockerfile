FROM ruby:3.4.9-slim
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
      build-essential \
      default-libmysqlclient-dev \
      git \
      nodejs \
      pkg-config \
      tzdata \
      vim \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /GatsuRails
COPY . /GatsuRails
RUN bundle install
# RUN whenever --update-crontab#  cron関係
# COPY entrypoint.sh /usr/bin/#  cron関係
# RUN chmod +x /usr/bin/entrypoint.sh#  cron関係
# ENTRYPOINT ["entrypoint.sh"]#  cron関係
