class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         attachment :profile_image

  has_many :photos, dependent: :destroy
  has_many :favorites, dependent: :destroy

 # フォローする側から見て、フォローされる側を(中間テーブルを経由して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
 # 中間テーブルを経由して「follower」モデルのCustomer(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower

 # フォローされる側から見て、フォローしてくる側を(中間テーブルを経由して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
 # 中間テーブルを経由して「following」モデルのCustomer(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(customer)
 # follow済みかどうか判定(今自分(引数のcustomer)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる)
    passive_relationships.find_by(following_id: customer.id).present?
  end

end
