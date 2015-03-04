class User < ActiveRecord::Base
  include Clearance::User

  validate :display_name, presence: true
end
