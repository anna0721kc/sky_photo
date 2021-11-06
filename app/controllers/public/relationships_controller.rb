class Public::RelationshipsController < ApplicationController

  def create
    follow = current_customer.active_relationships.build(follower_id: params[:customer_id])
    follow.save
    redirect_to customer_path(params[:customer_id])
  end


  def destroy
    follow = current_customer.active_relationships.find_by(follower_id: params[:customer_id])
    follow.destroy
    redirect_to customer_path(params[:customer_id])
  end

end