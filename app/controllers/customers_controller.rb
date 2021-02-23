class CustomersController < ApplicationController

  def show
    @customer = current_customer.id
  end

  def confirm
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