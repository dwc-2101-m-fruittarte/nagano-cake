class CustomersController < ApplicationController
  
  def show
    @customer = current_customer.id
  end

  def confirm
  end
  
  def withdraw
    current_customer.is_deleted = true
    current_customer.save
    reset_session
    redirect_to root_path
  end
  
end