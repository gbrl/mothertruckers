# mothertruckers

## Install gems, Re-build and re-populate the database.

bundle install && rm db/db.sqlite3 && bundle exec rake db:create && bundle exec rake db:migrate && ruby import.rb

## Dummy Users

User.create(email: "taco@lover.com", password: "hungry")
User.create(email: "burger@lover.com", password: "hungry")
User.create(email: "poutine@lover.com", password: "hungry")
User.create(email: "food@lover.com", password: "hungry")
