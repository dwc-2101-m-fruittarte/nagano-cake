class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    case resource
    when Manager
      managers_products_path
    when Customer
      root_path
    end
  end
  

# def after_sign_in_path_for(resource)
#   case resource
#   when Manager
#     managers_products_path
#   when Customer
#     root_path
#   end
# end


 def after_sign_up_path_for(resource)
   customers_path
 end

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :address, :phone_number])
 end

end