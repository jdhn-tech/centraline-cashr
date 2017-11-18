#!/bin/bash
rake db:drop
rake db:setup
rake db:migrate
rake admin:generate_test_data
