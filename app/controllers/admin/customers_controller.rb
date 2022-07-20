class Admins::CustomersController < ApplicationController
  

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
      redirect_to admins_customer_path(@customer.id)
      flash[:notice] = '会員情報が更新されました。'
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:cust).permit(
      :family_name, :first_name, :family_name_kana,
      :first_name_kana, :postal_code, :address,
      :phone_number, :email, :is_deleted)
  end
end