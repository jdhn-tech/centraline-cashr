#!/bin/bash
RAILS_ENV=development rake db:drop
RAILS_ENV=development rake db:setup
RAILS_ENV=development rake db:migrate
RAILS_ENV=development rake admin:generate_test_data
