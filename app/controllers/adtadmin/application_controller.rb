module Adtadmin
	class ApplicationController < ActionController::Base
		rescue_from CanCan::AccessDenied do |exception|
			flash[:error] = exception.message
			redirect_to main_app.root_url
		end
	end
end
