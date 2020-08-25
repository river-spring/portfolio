class Shelf < ApplicationRecord
	has_many :production, dependent: :destroy
	belongs_to :user, optional: true
	belongs_to :group, optional: true
	attachment :shelf_image
end
