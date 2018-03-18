class Subscription < ApplicationRecord
    validates :requestor, presence: true
    validates :target, presence: true
end
