require 'rails_helper'

RSpec.describe Block, type: :model do
  it { should validate_presence_of(:requestor) }
  it { should validate_presence_of(:target) }
end
