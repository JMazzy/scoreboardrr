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
* Install the correct Ruby version using `rvm` or similar tool
* Run the following commands from the project directory:
  * `gem install bundler` to install bundler
  * `bundle install` to install dependencies
  * `rake db:migrate` to run database migrations
  * `rails s` to run the server
* Go to `localhost:3000` in your browser
