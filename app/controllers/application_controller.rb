class ApplicationController < ActionController::Base
    include CanCan::ControllerAdditions
    before_action :set_locale
    before_action :authenticate_user!
    protect_from_forgery with: :null_session

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path
    end

    def set_locale
        I18n.locale = 'es'
    end
end
