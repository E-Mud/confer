FROM emud/ruby-on-rails:5

WORKDIR /app

COPY Gemfile /app/
COPY Gemfile.lock /app/

RUN bundle install

COPY . /app

EXPOSE 3000
