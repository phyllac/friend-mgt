require 'rails_helper'

RSpec.describe Block, type: :model do
  it { should validate_presence_of(:requestor) }
  it { should validate_presence_of(:target) }
  it { should validate_uniqueness_of(:target).scoped_to(:requestor).with_message('Target is already blocked') }
end
