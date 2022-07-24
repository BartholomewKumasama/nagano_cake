class Public::CustomersController < ApplicationController
   before_action :authenticate_customer!

  def show
    @customer = current_customer 
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customer_path(current_customer)
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdrawl
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end
  
 private
  def customer_params
    params.require(:customer).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email,:is_deleted)
  end
  
end
