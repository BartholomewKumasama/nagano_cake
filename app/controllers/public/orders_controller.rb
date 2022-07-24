class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = @order.total_price-800 #送料
  end
  
  def create
     @order = Order.new(order_params)
      cart_item = current_public.cart_items.all
     @order.save
      current_public.cart_items.each do | cart_item |
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.price
      order_detail.quantity = cart_item.quantity
      order_detail.save
      end
    cart_item.destroy_all
    redirect_to public_orders_complete_path
  end
  
  def index
    @orders = Order.all
  end
  
  def confirm
  end

  def complete
  end

 
 
end
