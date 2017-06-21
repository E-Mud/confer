FROM emud/ruby-on-rails:5

WORKDIR /app

RUN apt-get update && apt-get install apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install yarn

COPY Gemfile /app/
COPY Gemfile.lock /app/

RUN bundle install

COPY . /app

EXPOSE 3000
