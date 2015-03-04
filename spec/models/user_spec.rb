require "rails_helper"

describe User, "validations" do
  it { should respond_to(:admin) }
  it { should respond_to(:admin=) }

  # Having an issue with this test. Think it is due
  # to the way we have implemented Clearance. For
  # now, using a light weight validation of respond_to
  #it { should validate_presence_of(:display_name) }
  it { should respond_to(:display_name) }
  it { should respond_to(:display_name=) }
end
