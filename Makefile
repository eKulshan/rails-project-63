install:
	bundle install

tests:
	bundle exec rake test

lint:
	bundle exec rubocop