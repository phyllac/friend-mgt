require 'rails_helper'
require "validates_email_format_of/rspec_matcher"

RSpec.describe Connection, type: :model do
  it { should validate_presence_of(:requestor) }
  it { should validate_presence_of(:target) }
  it { should validate_email_format_of(:requestor).with_message('is not a valid email address') }
  it { should validate_email_format_of(:target).with_message('is not a valid email address') }
  it { should validate_uniqueness_of(:target).scoped_to(:requestor).with_message('Connection already exists') }
  
end
