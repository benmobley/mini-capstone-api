class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def current_user
    User.find_by(id: cookies.signed[:user_id])
  end

  def authenticate_user
    unless current_user
      render json: { message: "Must be logged in" }, status: :unauthorized
    end
  end

  def authenticate_admin
    unless current_user.admin
      render json: { message: "Must be logged in to admin account" }
    end
  end
end
