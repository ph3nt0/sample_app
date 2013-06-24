class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # Kijelentkeztetés a CSRF támadások kivédése érdekében
  def handle_unverified_request
    sign_out
    super
  end
end
