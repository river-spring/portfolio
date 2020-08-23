class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :name, :user_id])
	end

	# ログイン後のリダイレクト先
	def after_sign_in_path_for(resource)
	  	case resource
		   when Admin
			   admins_users_path
		   when User
		 	   users_user_path(current_user)
	  	end
  	end

	# ログアウト後のリダイレクト先
	def after_sign_out_path_for(resource)
    	case resource
		  when :admin
		    new_admin_session_path
		  when :user
		    root_path
    	end
  end
end
