class Recommendation < ApplicationRecord
	belongs_to :friend
	attachment :image
end
