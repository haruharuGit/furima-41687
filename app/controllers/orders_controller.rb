class OrdersController < ApplicationController
  def index
    @item = Item.find_by(params[:id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number,
                                          :item_id).merge(user_id: current_user.id)
  end
end
