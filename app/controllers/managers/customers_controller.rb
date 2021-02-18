class Managers::CustomersController < ApplicationController

  def index
    @customers = Customer.all
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
      redirect_to managers_customer_path(@customer)
    else
      render :edit
    end
  end

  private
  
	def customer_params
	  params.require(:customer).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:postcode,:address,:phone_number,:email,:is_deleted)
	end

end