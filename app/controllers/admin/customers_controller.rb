class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "You have updated data successfully"
      redirect_to admin_customer_path
    else
      render edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :encrypted_password, :is_deleted)
  end
end
