#!/bin/bash
RAILS_ENV=development bundle exec rake db:drop
RAILS_ENV=development bundle exec rake db:setup
RAILS_ENV=development bundle exec rake db:migrate
RAILS_ENV=development bundle exec rake admin:generate_test_data
