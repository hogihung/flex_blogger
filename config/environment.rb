# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load environment variables
if Rails.env.development? || Rails.env.test?
  app_environment_variables = File.join(Rails.root, 'config', 'app_environment_variables.rb')
  load(app_environment_variables) if File.exists?(app_environment_variables)
end

# Initialize the Rails application.
Rails.application.initialize!
