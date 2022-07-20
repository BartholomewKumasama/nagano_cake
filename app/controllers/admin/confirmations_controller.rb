# frozen_string_literal: true

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<<< HEAD:app/controllers/admin/confirmations_controller.rb
class Admin::ConfirmationsController < Devise::ConfirmationsController
========
class Public::ConfirmationsController < Devise::ConfirmationsController
>>>>>>>> origin/develop:app/controllers/public/confirmations_controller.rb
=======
class Public::ConfirmationsController < Devise::ConfirmationsController
>>>>>>> origin/develop
=======
class Admin::ConfirmationsController < Devise::ConfirmationsController
>>>>>>> origin/develop
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
