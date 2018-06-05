# Scoreboardrr

A scoreboard app for friendly competitions.

It's a bit different because I'm initially writing it to be run on an ad hoc LAN without internet (at a campground for a family reunion).

If I like it, I might keep working on it for fun and add normal web app stuff like security.

Stack:
* Ruby 2.4.2
* Rails 5.1.6
* Database: SQLite3
* Server: Puma
* UI Framework: Semantic UI

To run locally:
* Install correct Ruby version
* Run the following commands:
  * Install Bundler `gem install bundler`
  * Install dependencies `bundle install`
  * Run migrations `rake db:migrate`
  * Server `rails s`
