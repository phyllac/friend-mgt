class Connection < ApplicationRecord
    validates :requestor, presence: true
    validates :target, presence: true
    validates_uniqueness_of :target, scope: :requestor, message: 'Connection already exists'

    validates_email_format_of :requestor, :message => 'is not a valid email address'
    validates_email_format_of :target, :message => 'is not a valid email address'

    validate :target_should_not_be_equal_with_requestor
    validate :blocked_cant_be_added_as_friend
    validate :blocked_requestor_cant_be_added_as_friend
    
    def target_should_not_be_equal_with_requestor
        errors.add(:target, 'Email should not be the same as user') if target == requestor
    end

    def blocked_cant_be_added_as_friend
        blocked = Block.where(:requestor => requestor, :target => target)
        errors.add(:target, 'You have blocked this email') if blocked.count > 0
    end

    def blocked_requestor_cant_be_added_as_friend
        blocked = Block.where(:requestor => target, :target => requestor)
        errors.add(:target, 'You are blocked by the user') if blocked.count > 0
    end
end
