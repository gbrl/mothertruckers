# mothertruckers

## Getting Started

```bash
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ bundle exec rake db:populate
```

## Re-build and re-populate the database.

rm db/db.sqlite3 && bundle exec rake db:create && bundle exec rake db:migrate && ruby import.rb