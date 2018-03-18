class Block < ApplicationRecord
    validates :requestor, presence: true
    validates :target, presence: true
end
