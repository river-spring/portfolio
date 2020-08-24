class Production < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :shelf
	attachment :image
end
