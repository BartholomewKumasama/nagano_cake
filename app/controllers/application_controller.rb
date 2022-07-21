class ApplicationController < ActionController::Base

 def after_admin_sign_in_path_for(resource_or_scope)　#複数のdeviceがある場合この記述をする
    if resource.is_a?(Admin)
       admin_orders_path
    else
       root_path
    end
 end



#ここからpublic＝＝＝＝＝＝＝＝＝＝＝＝

  def after_customers_sign_in_path_for(resource)
    public_root_path
  end

  def after_customers_sign_up_path_for(resource)
    public_customer_path
  end

  def after_customers_sign_out_path_for(resource)
    about_path
  end

end