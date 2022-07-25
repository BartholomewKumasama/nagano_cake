class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
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



  def confirm
       @order = Order.new(order_params)
       @cart_items=current_customer.cart_items.all
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
    params.require(:order).permit(:payment_method, :customer_id, :address, :name, :billing_amount, :postage)
  end

end
