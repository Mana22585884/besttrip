class Like < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  validates_uniqueness_of :tweet_id, scope: :user_id
end
