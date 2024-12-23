FROM ruby:3.3.6

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["sh", "-c", "bin/rails db:migrate && bin/rails db:seed && bundle exec rails server -b 0.0.0.0 -p 3000"]