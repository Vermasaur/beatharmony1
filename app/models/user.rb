class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         has_many :posts, dependent: :destroy # remove a user's posts if his account is deleted.
         has_many :active_relationships, class_name: "Relationship", foreign_key: "trusting_id", dependent: :destroy
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "trusted_by_id", dependent: :destroy
         
         has_many :trusting, through: :active_relationships, source: :trusted_by
         has_many :trusted_by, through: :passive_relationships, source: :trusting
         
         
         # helper methods
         
         # trust another user
         def trust(other)
           active_relationships.create(trusted_by_id: other.id)
         end
         
         # untrust a user
         def untrust(other)
           active_relationships.find_by(trusted_by_id: other.id).destroy
         end
         
         # is trusting a user?
         def trusting?(other)
           trusting.include?(other)
         end
end