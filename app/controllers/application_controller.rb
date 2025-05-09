class ApplicationController < ActionController::Base

	rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
	after_action :set_vary_header

	def index
		render template: 'layouts/application'
	end

  # ¿Hay un administrador logueado?
	# def authenticate_admin!
	# 	if signed_in?
	# 	redirect_to root_path if !current_user.admin?
	# 	else
	# 		authenticate_user!
	# 	end
	# end

	def render_not_found
    @page = Page.find_by_slug("404")
    render template: 'errors/not_found', status: :not_found, layout: 'errors'
	end

  private

	def locale_valid?(locale)
		I18n.available_locales.map(&:to_s).include?(locale)
	end

    def set_vary_header
		response.headers["Vary"] = "accept" if request.xhr?
	end

end