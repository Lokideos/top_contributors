FROM ruby:2.6.0

RUN apt-get update && apt-get install -y postgresql postgresql-contrib tzdata nodejs libpq-dev
RUN gem install rails -v '5.2.2'

WORKDIR /usr/app

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY . .

CMD ["puma"]

