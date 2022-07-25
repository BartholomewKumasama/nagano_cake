class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
  end

  def create
     @order = Order.new(order_params)
     cart_item = current_customer.cart_items.all
     @order.postage = 800
     @order.save
      current_customer.cart_items.each do | cart_item |
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.save
      end
    cart_item.destroy_all
    redirect_to complete_public_orders_path
  end



  def confirm
       @cart_items = CartItem.all
       @order = current_customer.orders.new  
       #@order = Order.new(order_params)
       #@cart_items=current_customer.cart_items
       @total = 0
      
    if params[:order][:select_address]=="0"
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address]=="1"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
    end
  end

  def complete
  end
  
  def index
     @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

 private
  def order_params
    params.require(:order).permit(:payment_method, :customer_id,:post_code, :address, :name, :billing_amount, :postage)
  end

end
