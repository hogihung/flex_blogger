require "rails_helper"

describe EditorPost, type: :model do
  it { expect(subject).to validate_presence_of :editor }
  it { expect(subject).to validate_presence_of :post }

  it { expect(subject).to have_db_index :post_id }
  it { expect(subject).to have_db_index :editor_id }
end
