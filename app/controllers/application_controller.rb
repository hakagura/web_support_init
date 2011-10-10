class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = 'Sem permissao de acesso'
    redirect_to root_url
  end
end
