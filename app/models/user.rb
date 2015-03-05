class User < ActiveRecord::Base
  include Clearance::User

  validates :display_name, presence: true
end
