class Photo < ApplicationRecord
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  def favorited_by?(customer)
    favorites.where(user_id: user.id).exists?
  end

  geocoded_by :address
  after_validation :geocode

  attachment :image

end
