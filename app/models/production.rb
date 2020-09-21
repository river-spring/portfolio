class Production < ApplicationRecord
  # アソシエーションに関する記述
  has_many :comments, dependent: :destroy
  belongs_to :shelf
end
