class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
  include SessionsHelper

  private
  def login_required
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
