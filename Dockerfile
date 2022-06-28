FROM ruby:3.1.1
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn git vim
WORKDIR /GatsuRails
COPY . /GatsuRails
RUN bundle install
RUN yarn
# RUN whenever --update-crontab#  cron関係
# COPY entrypoint.sh /usr/bin/#  cron関係
# RUN chmod +x /usr/bin/entrypoint.sh#  cron関係
# ENTRYPOINT ["entrypoint.sh"]#  cron関係
