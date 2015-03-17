#Flex Blogger

**Note: This application is currently in the early development stage.  We will be making many changes.  Please keep that in mind if you clone.**

* Ruby version: 2.1.5
* Rails version: 4.1.7
* Database:  Postgres
* Test suite:  RSpec
* Frontend Framework: Bourbon, Neat, Bitters and Refill<br>
* Authentication: Clearance
* Form Generator: Simple Form
* Templating Language: Erb 

*See the Gemfile for more information*

##Getting Started
Clone the application:
```
clone https://github.com/hogihung/flex_blogger.git
cd flex_blogger
```


Create a file in your `apps root` folder named `.env` and add the following:
```
S3_BUCKET:             'your_s3_bucket_name_here'
AWS_ACCESS_KEY_ID:     'your_aws_access_key_id_here'
AWS_SECRET_ACCESS_KEY: 'your_aws_secret_access_key_here'
```
This will allow you to upload images to Amazon S3 through the WYSIWYG editor.


Prepare your database:
```
The first rake below is optional - may be needed if you are updating from SQLite version:
rake db:drop  (Use with caution, and only use if needed!!!)

rake db:create
rake db:migrate
```

## Prime Development Data
To ensure we have consistent data when we are testing, use the following command to reset your dev database:

```
rake dev:prime
```

## Misc. Configuration Settings
Edit the config/initializers/clearance.rb file and update the following with your information:

```
  config.mailer_sender = "reply@example.com"
```

