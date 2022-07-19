class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters , if: :devise_controller?

 def after_sign_in_path_for(resource_or_scope)
     if resource.is_a?(Admin)
        admin_orders_path
      else
        root_path
      end
    end
end
