#Flex Blogger

**Note: This application is currently in the early development stage.  We will be making many changes.  Please keep that in mind if you clone.**

* Ruby version: 2.1.5
* Rails version: 4.1.7
* Database:  Postgres
* Test suite:  RSpec
* Frontend Framework: Bourbon, Neat, Bitters and Refill<br>
* Authentication: Devise
* Form Generator: Simple Form
* Templating Language: Haml

##Getting Started

Create a file in your `config` folder named `app_environment_variables.rb` and add the following:
```
ENV['S3_BUCKET']             = 'foo'
ENV['AWS_ACCESS_KEY_ID']     = 'bar'
ENV['AWS_SECRET_ACCESS_KEY'] = 'baz'
```
This will allow you to upload images to Amazon S3 through the WYSIWYG editor.

## Prime Development Data
To ensure we have consistent data when we are testing, use the following command to reset your dev database:

```
rake dev:prime
```

##Database Tables:
```
Categories
  id
  description (40)
  created_by (current_user)
  create_date
  update_date

Posts
  id
  title (120)
  body
  category.id
  user.id
  status
  create_date
  update_date

Users
   id
   name
   email
   password
```
<br>
**Static Pages**
-  About
-  Contact

**Future Features**
* Tags
* Contributors
* Add Footer (DL)
* Fix Failing Category test (DL)
* Add Test for User Sign In/Out (DL)
* Add Categories to Posts (Josh)
* Add controller test for post redirect (Josh)
