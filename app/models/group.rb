class Group < ApplicationRecord
  # バリデーション
  validates :name, length: { in: 1..20 }, presence: true
  validates :outline, length: { maximum: 300 }
  # アソシエーション
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :shelves, dependent: :destroy
  attachment :image
  # 管理者用グループ検索機能
  def self.admin_search(_category, word)
    Group.where('name LIKE ?', "%#{word}%")
  end
end
