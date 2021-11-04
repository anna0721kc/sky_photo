class Public::RelationshipsController < ApplicationController

  def create
    @customer =Ccustomer.find(params[:relationship][:following_id])
    current_customer.follow(@customer)
    # respond_to do |format|
    #   format.html {redirect_back(fallback_location: root_url)}
    #   format.js
    # end
  end


  def destroy
    @customer = Customer.find(params[:relationship][:following_id])
    current_customer.unfollow(@customer)
    # respond_to do |format|
    #   format.html {redirect_back(fallback_location: root_url)}
    #   format.js
    # end
  end

end