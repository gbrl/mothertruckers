# mothertruckers

## Install gems, Re-build and re-populate the database.

bundle install && rm db/db.sqlite3 && bundle exec rake db:create && bundle exec rake db:migrate && ruby import.rb