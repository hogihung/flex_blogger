# You can use this file to setup your initial user accounts
#
# Usage: Type the following at a command prompt in your application directory:
#        rake db:seed
#
#        Note: If seeding for production, you may need to use:
#        rake RAILS_ENV=production db:seed
#
User.create(email: "admin_user@example.com", password: "rob0ts84", display_name: "Sog", admin: true)
User.create(email: "mod_one_user@example.com", password: "mypassw0rd", display_name: "Moddyun", admin: false)
User.create(email: "mod_two_user@example.com", password: "mydogsname", display_name: "Moddydu", admin: false)

