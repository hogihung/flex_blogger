require "rails_helper"

describe Post, "validations" do
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

  it { should validate_inclusion_of(:status).in_array(status_array) }

  it { should ensure_length_of(:title).is_at_most(50) }

end
