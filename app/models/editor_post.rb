class EditorPost < ActiveRecord::Base
  belongs_to :editor, class_name: User
  belongs_to :post

  validates_presence_of :editor, :post
end
