require "rails_helper"

describe User, "validations" do
  it { should respond_to(:admin) }
  it { should respond_to(:admin=) }

  it { should validate_presence_of(:display_name) }
end
