class Relationship < ActiveRecord::Base
    belongs_to :trusting, class_name: "User"
    belongs_to :trusted_by, class_name: "User"
    validates :trusting_id, presence: true
    validates :trusted_by_id, presence: true
end