class Connection < ApplicationRecord
    validates :requestor, presence: true
    validates :target, presence: true        
    validates_uniqueness_of :target, scope: :requestor, message: 'Connection already exists'
end
