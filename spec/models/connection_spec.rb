require 'rails_helper'

RSpec.describe Connection, type: :model do
  it { should validate_presence_of(:requestor) }
  it { should validate_presence_of(:target) }
  it { should validate_uniqueness_of(:target).scoped_to(:requestor).with_message('Connection already exists') }
  
end
