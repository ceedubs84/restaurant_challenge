# Call these commands with 'make [test, server, install, console, etc.]'

BE=bundle exec

install:
	bundle install

migrate:
	$(BE) rake db:migrate

test: install
	$(BE) rspec

server: install
	$(BE) rails s

console: install
	$(BE) rails c


.PHONY: install test server console migrate