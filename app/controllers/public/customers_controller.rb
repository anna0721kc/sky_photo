#会員側／customerコントローラ
class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
  end

  def follow
  end

  def follower
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: false)
    sign_out current_customer
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :profile_image, :introduction)
  end
end
