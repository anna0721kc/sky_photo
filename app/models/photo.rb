class Photo < ApplicationRecord
  belongs_to :customer
  has_many :favorites, dependent: :destroy
   # ↓引数で渡されたcustomer_idがFavoritesテーブル内に存在(exists?)するかどうか
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  geocoded_by :address # address(住所)から緯度経度が算出される
  after_validation :geocode # addressが登録された直後にgeocodeが呼び出される
  attachment :image

  validates :address, presence: true
  validates :image, presence: true
end
