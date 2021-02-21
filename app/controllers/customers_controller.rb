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
    @customer = current_customer.id
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
end