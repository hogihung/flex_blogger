#Flex Blogger

**Note: This application is ready for early adoption.  There may be a few updates as we discover and fix bugs or modify features.**

* Ruby version: 2.1.5
* Rails version: 4.1.7
* Database:  Postgres
* Test suite:  RSpec
* Frontend CSS Framework: Bourbon, Neat, Bitters and Refill<br>
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

## Preparing for Production
1.  Edit the app/views/about and contact files to supply your static information.
2.  Edit the db/seeds.rb file, replacing the sample data, with your information.
3.  Import the users from step 2 by using the following command:

```
rake RAILS_ENV=production db:seed
```


