class Shelf < ApplicationRecord
	# バリデーション
	validates :name, length: { in: 1..20 }, presence: true
	validates :outline, length: { maximum: 300 }
	# アソシエーション
	has_many :production, dependent: :destroy
	belongs_to :user, optional: true
	belongs_to :group, optional: true
	attachment :shelf_image
end
