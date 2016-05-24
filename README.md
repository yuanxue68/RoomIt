#Roomit  
A site to look for rental listings
[Demo on free tier Heroku](https://damp-scrubland-65588.herokuapp.com/) 
### How to run it on your local machine
######After you clone the repository:
This project uses PostgreSQL
Create all the databases specifield in database.yml
```ruby
rake db:create:all
```

Install all the required gems
```ruby
Bundle install
```

Start the server on port 3000
```ruby
rails server         #start up rails server
```
