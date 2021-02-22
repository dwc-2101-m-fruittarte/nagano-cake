class CustomersController < ApplicationController

  def show
    @customer = current_customer.id
  end

  def edit
    @customer = current_customer.id
  end

  def update
    @customer = current_customer.id
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render "edit"
    end
  end

  def confirm
    @customer = current_customer.id
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    #現在ログインしているユーザーを@userに格納
    @customer.update(is_deleted: "Available")
    #updateで登録情報をInvalidに変更
    reset_session
    redirect_to root_path
  end

end