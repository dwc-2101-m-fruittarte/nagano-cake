class DeliveriesController < ApplicationController

  def index
    @delivery_new = Delivery.new
    @deliveries = current_customer.deliveries
  end

  def create
    @delivery = Delivery.new(deliveries_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
       redirect_to deliveries_path
    else
       render :index
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    delivery.update(deliveries_params)
    redirect_to deliveries_path
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to deliveries_path
  end

  private

  def deliveries_params
      params.require(:deliveries).permit(:customers_id, :name, :postcode, :address)
  end

end