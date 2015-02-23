class Post < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  validates :title, presence: true
  validates :title, length: { maximum: 50 }

  validates :body, presence: true
  validates :slug, presence: true

  validates :category, presence: true
  validates :status, presence: true, inclusion: { in: :acceptable_status }

  scope :recent, -> { order(created_at: :desc).first(3) }
  scope :last_ten, -> { order(created_at: :desc).first(10) }

  STATUS_CHOICES = %w(draft published archived retired)

  private

  def acceptable_status
    %w(draft published archived retired)
  end

  # Friendly ID method for generating slugs
  def should_generate_new_friendly_id?
    title_changed?
  end

end
