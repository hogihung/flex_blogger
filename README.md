== README
* Ruby version: 2.1.5

* Rails version: 4.1.7

* Database:  Postgres 

* Test suite:  RSpec

Frontend Framework - Bourbon, Neat, Bitters and Refill
Devise
Simple Form (form generator)
Haml

Name:  Flex_Blogger

Tables
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
 
Static Pages
  About
  Contact


Future Features
  Tags
  Contributors
  Image Upload
