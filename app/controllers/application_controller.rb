# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = 'Você não possui permissão de acesso para esta página!'
    redirect_to root_url
  end
end
