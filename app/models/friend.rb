class Friend < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: 'User'
	has_many :recommendation, dependent: :destroy
	validates :user_id, presence: true
    validates :friend_id, presence: true
end
