class ApplicationController < ActionController::Base

 def after_sign_in_path_for(resource_or_scope)　#複数のdevice
    if resource.is_a?(Admin)
       admin_orders_path
    else
       root_path
    end
 end

end
