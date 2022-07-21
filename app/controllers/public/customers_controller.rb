class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer 
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_show_path
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end
  
 
  
end
