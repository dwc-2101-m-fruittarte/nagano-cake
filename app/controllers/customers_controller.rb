class CustomersController < ApplicationController

  def show
    @customer = current_customer.id
  end


  def edit
    @customer = current_customer
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
  end

  def withdraw
    current_customer.is_deleted = true
    current_customer.save
    reset_session
    redirect_to root_path
  end

end