class Public::FavoritesController < ApplicationController

  def create

    @photo = Photo.find(params[:photo_id]) # POST /photos/8/favorites -> POST /favorites.8 <-> link_to 'favoirte', favorites_path(@photo)
    @favorite = current_customer.favorites.new(photo_id: @photo.id)
    @favorite.save
    redirect_to photo_path(@photo)
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @favorite = current_customer.favorites.find_by(photo_id: @photo.id)
    @favorite.destroy
    redirect_to photo_path(@photo)
  end

  def index
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:photo_id)#.pluck：引数に指定したカラムの値を配列で返してくれるメソッド
    @favorite_list = Photo.find(favorites)
  end
end
