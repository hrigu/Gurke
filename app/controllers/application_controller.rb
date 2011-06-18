class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery

  #
  # Rails provides a method called rescue_from that we can place in our ApplicationController.
  # We pass it an exception and pass it either a method or a block. We’ll pass a block
  # and inside it make the application show a flash error message and redirect to
  # the home page.
  rescue_from CanCan::AccessDenied do |exception|
#    puts exception
    flash[:error] = "Access denied."
    redirect_to root_url #better stay on current page
  end
end
