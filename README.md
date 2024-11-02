# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


How to create an object using graphql

'rails g graphql:object name_of_your_object'
the object usually is a model
this will create a type in 'graphql/types/name_of_your_object'

How to create your query

app/graphql/type/query_type.rb

How to create a mutation in graphql
mutation are like CRUD actions, you know it's something that you can change

