class Shelf < ApplicationRecord
	has_many :production, dependent: :destroy
	belongs_to :user
	belongs_to :group
	attachment :shelf_image
end
