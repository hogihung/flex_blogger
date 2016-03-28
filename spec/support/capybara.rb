require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'capybara/poltergeist'

if ENV['SELENIUM']
  Capybara.default_max_wait_time = 10
  Capybara.default_driver = :selenium
  Capybara.javascript_driver = :selenium
  Capybara.register_driver :selenium do |app|
    prefs = {
      # Add any custom preferences here
    }
    caps = Selenium::WebDriver::Remote::Capabilities.chrome
    caps['chromeOptions'] = {'prefs' => prefs,
                              'args' => ['disable-desktop-notifications']
                            }
    Capybara::Selenium::Driver.new(app,
                                  :browser => :chrome,
                                  :desired_capabilities => caps,
                                  :args => ["--window-size=1920,1080"]
    )
  end

  Capybara.run_server = false
  Capybara.app_host = 'http://localhost:3000'

  # Check to see if the server is running (for Selenium tests only)
  if Capybara.default_driver == :selenium && !Capybara.run_server
    begin
      open(Capybara.app_host)
    rescue
      puts "\nCannot connect to server #{Capybara.app_host}\n\n"
      exit
    end
  end

else
  # Poltergeist -- the default
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
      app,
      {
        timeout: 120,
        debug: false, # change this to true to troubleshoot
        window_size: [1920, 1080] # this can affect dynamic layout
      }
    )
  end
  Capybara.javascript_driver = :poltergeist
  Capybara.default_driver = :rack_test

end
