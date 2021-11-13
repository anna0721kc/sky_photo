class Public::PhotosController < ApplicationController
#「before_action :authenticate_customer!」は不要
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.customer_id = current_customer.id#ログイン後に投稿可
    if @photo.save
      redirect_to photo_path(@photo)
    else
      render template: 'public/photos/new'#ディレクトリ指定する
    end
  end

  def index
    @photos = Photo.page(params[:page]).per(10)
  end

  def show
    @photo = Photo.find(params[:id])
    gon.photo = @photo
  end

  def edit
    @photo = Photo.find(params[:id])
    if @photo.customer_id != current_customer.id
    redirect_to photo_path(@photo)
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
    else
      render:edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :address, :latitude, :longitude, :introduction)
  end
end
