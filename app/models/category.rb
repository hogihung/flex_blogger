class Category < ActiveRecord::Base
  validates :description, presence: true
  validates :description, length: { maximum: 40 }
end
