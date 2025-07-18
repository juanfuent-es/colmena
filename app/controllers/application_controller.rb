class ApplicationController < ActionController::Base
  include VisitorHelper

  rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
  before_action :require_visit_registration
  after_action :set_vary_header

  def index
    render template: "layouts/application"
  end

  # ¿Hay un administrador logueado?
  def authenticate_admin!
    if signed_in?
      redirect_to root_path if !current_user.admin?
    else
      authenticate_user!
    end
  end

  # ¿Hay un usuario logueado (admin o editor)?
  def authenticate_user_or_admin!
    authenticate_user!
    redirect_to root_path unless current_user.admin_or_editor?
  end

  def render_not_found
    @page = Page.find_by_slug("404")
    render template: "errors/not_found", status: :not_found, layout: "errors"
  end

  private

  def require_visit_registration
    @domain = Rails.env.development? ? "http://localhost:3000" : ENV.fetch("domain") { "https://juanfuent.es" }
    unless visitor_logged?
      visitor_login(request.remote_ip)
    end
  end

  def locale_valid?(locale)
    I18n.available_locales.map(&:to_s).include?(locale)
  end

  def set_vary_header
    response.headers["Vary"] = "accept" if request.xhr?
  end
end
