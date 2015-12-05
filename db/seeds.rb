# You can use this file to setup your initial user accounts
#
# Usage: Type the following at a command prompt in your application directory:
#        rake db:seed
#
#        Note: If seeding for production, you may need to use:
#              rake RAILS_ENV=production db:seed
#
# ------------------------------------------------------------------------------
# Create an admin user and two contributors
User.create(email: "admin_user@example.com", password: "rob0ts84",
            display_name: "Sog", admin: true)
User.create(email: "mod_one_user@example.com", password: "mypassw0rd",
            display_name: "Moddyun", admin: false)
User.create(email: "mod_two_user@example.com", password: "mydogsname",
            display_name: "Modydun", admin: false)
# Create three default blog post categories - you can add more here or via the
# web gui after you login as an Admin
Category.create(description: "Programming")
Category.create(description: "DevOps")
Category.create(description: "Social")
