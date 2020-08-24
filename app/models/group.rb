class Group < ApplicationRecord
	has_many :group_users, dependent: :destroy
	has_many :shelves, dependent: :destroy
	attachment :image
end
