class EditorPost < ActiveRecord::Base
  belongs_to :editor, class_name: User
  belongs_to :post

  validates :editor, :post, presence: true
end
