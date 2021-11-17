class Public::RelationshipsController < ApplicationController
  def create
    follow = current_customer.active_relationships.build(follower_id: params[:customer_id])
    follow.save
    redirect_to follows_customer_path(current_customer)
  end
  def destroy
    follow = current_customer.active_relationships.find_by(follower_id: params[:customer_id])
    follow.destroy
    redirect_to followers_customer_path(current_customer)
  end
end