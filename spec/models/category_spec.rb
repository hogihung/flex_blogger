require "rails_helper"

describe Category, "validations", type: :model do
  it { should respond_to(:description) }
  it { should respond_to(:description=) }

  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_most(40) }
 end
