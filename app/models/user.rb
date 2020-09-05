class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # バリデーション
          USER_REGEX = /\A[a-z0-9]+\z/i
          validates :user_id, uniqueness: true, presence: true, format: {with: USER_REGEX}, length: { in: 5..12 }
          validates :password, format: {with: USER_REGEX}
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
            unless self == other_user
                self.friends.find_or_create_by(friend_id: other_user.id)
            end
         end

         def refuse(other_user)
            friend = self.friends.find_by(friend_id: other_user.id)
            friend.destroy if friend
         end

         def request?(other_user)
            self.requests.include?(other_user)
         end
         # ユーザー検索機能
         def User.search(user, word)
            if user == "name"
                User.where('name LIKE ?', "%#{word}%")
            else
                User.where('user_id LIKE ?', "%#{word}%")
            end
         end
end
