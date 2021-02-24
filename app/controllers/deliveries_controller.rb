class DeliveriesController < ApplicationController

  def index
    @delivery_new = Delivery.new
    @deliveries = current_customer.deliveries
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      @delivery_new = Delivery.new
      @deliveries = current_customer.deliveries
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
    if @delivery.update(delivery_params)
      redirect_to deliveries_path
    else
      render 'deliveries/edit'
    end
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to deliveries_path
  end

  private

  def delivery_params
      params.require(:delivery).permit(:name, :postcode, :address)
  end

end