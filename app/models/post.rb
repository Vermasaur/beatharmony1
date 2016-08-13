class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 } # posts are capped at 300 chars.
  default_scope -> { order(created_at: :desc) } # newest tweets / posts first. I WANT TO MAKE THIS BY TRUSTEDNESS HOTNESS OR UPVOTEDNESS 
end
