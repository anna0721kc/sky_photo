#会員側／customerコントローラ
class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def follow
  end

  def follower
  end

  def unsubscribe
  end

  def withdraw
  end
end
