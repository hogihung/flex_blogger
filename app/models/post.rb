class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :title, length: { maximum: 50 }

  validates :body, presence: true

  validates :status, presence: true, inclusion: { in: :acceptable_status}


  private
  def acceptable_status
    %w(draft published archived retired)
  end
end
