require "rails_helper"

describe Post, "validations", type: :model do
  let :status_array do
    %w(draft published archived retired)
  end

  it { should respond_to(:title) }
  it { should respond_to(:title=) }

  it { should respond_to(:body) }
  it { should respond_to(:body=) }

  it { should respond_to(:status) }
  it { should respond_to(:status=) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:status) }

  it { should validate_presence_of(:author) }

  it { should validate_inclusion_of(:status).in_array(status_array) }

  it { should validate_length_of(:title).is_at_most(50) }

  it { should have_many(:editor_posts) }
  it { should have_many(:editors).through(:editor_posts) }
end
