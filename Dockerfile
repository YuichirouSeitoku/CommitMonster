FROM ruby:2.6
WORKDIR /CommitMonster
COPY Gemfile /CommitMonster/Gemfile
COPY Gemfile.lock /CommitMonster/Gemfile.lock
RUN bundle install
COPY . /CommitMonster

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
