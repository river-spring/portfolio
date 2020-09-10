class Friend < ApplicationRecord
  # バリデーション
  validates :user_id, presence: true
  validates :friend_id, presence: true
  # アソシエーション
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
