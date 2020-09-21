class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  # バリデーション
  USER_REGEX = /\A[a-z0-9]+\z/i.freeze
  validates :user_id, uniqueness: true, presence: true, format: { with: USER_REGEX }, length: { in: 5..12 }
  validate :password_validator
  validates :name, length: { in: 1..20 }, presence: true
  validates :introduction, length: { maximum: 300 }
  # アソシエーション
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :shelves, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recommendation, dependent: :destroy
  # refile関連
  attachment :mypage_image
  attachment :profile_image
  # 退会機能
  acts_as_paranoid
  # 友達申請に関するアソシエーション
  has_many :friends
  has_many :requests, through: :friends, source: :friend
  has_many :reverse_of_friends, class_name: 'Friend', foreign_key: 'friend_id'
  has_many :my_friends, through: :reverse_of_friends, source: :user
  # 友達申請機能
  def request(other_user)
    friends.find_or_create_by(friend_id: other_user.id) unless self == other_user
  end

  def refuse(other_user)
    friend = friends.find_by(friend_id: other_user.id)
    friend&.destroy
  end

  def request?(other_user)
    requests.include?(other_user)
  end

  # ユーザー検索機能
  def self.search(user, word)
    if user == 'name'
      User.where('name LIKE ?', "%#{word}%")
    else
      User.where('user_id LIKE ?', "%#{word}%")
    end
  end

  # 管理者用ユーザー検索機能
  def self.admin_search(category, word)
    if category == 'user_name'
      User.where('name LIKE ?', "%#{word}%")
    elsif category == 'user_id'
      User.where('user_id LIKE ?', "%#{word}%")
    end
  end

  # パスワードに関するバリデーション
  def password_validator
    return if password.blank? || password =~ /\A[a-z0-9]+\z/i

    errors.add :password, 'パスワードは半角英数で入力してください。'
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: 'ゲストログイン', user_id: 'guestlogin', introduction: 'ゲストログイン用マイページです。ユーザー編集は使用できません。ユーザー編集ではプロフィール画像やマイページ画像を変更することもできます。') do |user|
      user.password = guestloginusers
    end
  end
end
