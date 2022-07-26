class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
  	@order = Order.find(params[:id])
  # 	@order_items = @order.order_items
  	@order_details = @order.order_details
  end

  def history
    @customer = Customer.find(params[:id])
    @orders = Order.where(customer_id: params[:id]).order(id: "DESC").page(params[:page])
  end

  def update
  	@order = Order.find(params[:id])
  # 	@order_items = @order.order_items
  	@order.update(order_params)

  		 redirect_to admin_order_path(@order)
  end

  private

  def order_params
  	params.require(:order).permit(:status)
  end
end