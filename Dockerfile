FROM ruby:2.6.3
# Instalamos updates
RUN apt-get update -qq

WORKDIR /app
# Primero copiamos los Gemfile para utilizar el cache de layers si no cambia ningun paquete
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler
RUN gem install foreman
RUN bundle install

COPY . .

CMD ["foreman", "start"]
EXPOSE 5000