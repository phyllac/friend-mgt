class Subscription < ApplicationRecord
    validates :requestor, presence: true
    validates :target, presence: true
    validates_uniqueness_of :target, scope: :requestor, message: 'Subcription already exists'

    validates_email_format_of :requestor, :message => 'is not a valid email address'
    validates_email_format_of :target, :message => 'is not a valid email address'

    validate :target_should_not_be_equal_with_requestor
    
    def target_should_not_be_equal_with_requestor
        errors.add(:target, 'Target should not be the same as requestor') if target == requestor
    end
end
