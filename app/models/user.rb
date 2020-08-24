class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :friend_requests, dependent: :destroy
         has_many :recommendation, dependent: :destroy
         has_many :group_users, dependent: :destroy
         has_many :shelves, dependent: :destroy
         has_many :comments, dependent: :destroy

         has_many :friends, dependent: :destroy
         attachment :mypage_image
         attachment :profile_image
         # has_many :followings, through: :friends, sourse: :friend
         # has_many :reverse_of_friends, class_name: 'Friend', foreign_key: 'friend_id'
         # has_many :followers, through: :reverse_of_friends, source: :user
end
