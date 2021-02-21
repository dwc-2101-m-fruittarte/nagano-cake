class CustomersController < ApplicationController
  
  def show
    @customer = current_customer.id
  end

  def edit
    @customer = current_customer.id
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render "edit"
    end
  end

  def confirm
    @customer = Customer.fin(params[:id])
  end
  
  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :address, :phone_number, :is_deleted)
  end
  
end
