#Flex Blogger

**Note: This application is ready for early adoption.  There may be a few updates as we discover and fix bugs or modify features.**

* Ruby version: 2.2.2
* Rails version: 4.2.4
* Database:  Postgres
* Test suite:  RSpec
* Frontend CSS Framework: Bourbon, Neat, Bitters and Refill<br>
* Authentication: Clearance
* Form Generator: Simple Form
* Templating Language: Erb

*See the Gemfile for more information*

##Revisions
-March 27, 2016-
Added capybara-screenshot to assist in the development process when we have a failing test.  Since this application was created with the new Rails developer in mind, there are two failing tests.  These failing tests will create a html and png snapshot where the error occurs.

Updated some gems to newer versions which led to some issues with our model tests that are using shoulda-matchers.  Resolved by applying the new type: :model tag.

Configured Capybara to support poltergeist and selenium.

Use the following syntax to use Selenium with one of the failing tests:
```
SELENIUM=true rspec spec/features/visitor/contacts_spec.rb
```


##Before you begin
If you were to dig in and review some of the earlier commits you can see that originally haml was used as the template language.  As I talked and worked with other newbies I decided to bring things back to the basics.  All of the views that were formatted using haml were converted to erb.  While I do use haml at the day job and on other projects, the goal of FlexBlogr was to create a Rails based blog application that is friendly to the new Ruby on Rails developer.

I'm still fumbling my way through CSS, so please keep that in mind.  But I do think that things are good enough and I'll leave it to you to tinker with FlexBlogr, tune it to meet your needs and have fun with it.


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

## Using your own hero image
Edit the file located at: app/assests/stylesheets/custom.css.scss

```
  $hero-image: 'https://raw.githubusercontent.com/thoughtbot/refills/master/source/images/mountains.png';
```

## Setup your website title and sub-title
Edit the file(s): <br>
config/environments/production.rb <br>
config/environments/development.rb (optional)

Adjusting the following settings:

```
# Configure your websites title and sub-title
config.title = "Your Awesome Blog Name Goes Here"
config.sub_title = "Put your sub-title or tag line here."
```

## Configure the RSS Feed Builder
Edit the file app/views/home/feed.rss.builder and update these settings:

```
  xml.title "Your Blog Name Goes Here"
  xml.author "Your Name Here"
  xml.description "Some Info To Describe, Can be comman separated, Ruby, Rails"
  xml.link "http://yourdomain.here"

      xml.author "Your Name Here"
      xml.link "http://yourdomain.io/" + article.slug
```

## Run the tests
You can run the test suite, which is RSpec based, by executing the following command:

```
rspec
``` 

## Start Web Server - Development environment
```
rails server
```


## Preparing for Production
1.  Edit the app/views/about & contact files to supply your static information.
2.  Edit the db/seeds.rb file, replacing the sample data, with your information.
3.  Setup your production database using the following command:

```
rake RAILS_ENV=production db:setup
```

*Optional* - the rake db:setup task will read in your seeds file.  However, if
you forgot to update, or want to add more users/categories after you have deployed,
you can use the following to read in the new information in your seeds file:

```
rake RAILS_ENV=production db:seed
```



