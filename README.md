# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

<%= f.label "Select a Team from the List or Create your own team" %>
<%= collection_select :team, :teamname, Team.all, :id, :teamname %> <br>

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
