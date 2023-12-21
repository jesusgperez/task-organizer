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

# Important commands
rails g simple_form:install --bootstrap    
rails g scaffold Category name:string description:text
rails db:create
rails db:migrate
rails g devise:install          # Creates the devise user system
rails routes                    # Prints all the routes created
rails g migration add_owner_to_task user:references
rails db:seed                   # Scripts to perform into the database
rails g mailer                  # Creates the directory structure for mails

# Important Gems
gem 'annotate': This gem will declare explicitly the model attributes into the model file (as comments)

# Routes
rails/info/routes               # All the information about the routes

# Callbacks
before_action -> for controllers in the request process (Similar to middleware in django)
before_create -> for databases when creating a model (Similar to signals in django)
