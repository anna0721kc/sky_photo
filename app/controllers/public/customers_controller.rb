#会員側／customerコントローラ
class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "You have updated data successfully"
      redirect_to customers_my_page_path
    else
      render edit
    end
  end

  def follow
  end

  def follower
  end

  def unsubscribe
    @customer = current_customer
    if @customer.update(is_deleted: false)
      sign_out current_customer
    end
    redirect_to root_path
  end

  def withdraw
    @customer = current_customer

  end

  private
  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end
end
