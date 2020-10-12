class ApplicationController < ActionController::Base
  
  respond_to :html, :js
  
  protect_from_forgery with: :exception    # Prevent CSRF attacks by raising an exception.

  before_action :authenticate_user!	
  before_action :set_locale


 	def default_url_options
 		{locale: I18n.locale}
 	end

 	def set_locale
 		I18n.locale = extract_locale || I18n.default_locale
 	end

 	def extract_locale
 		parsed_locale = params[:locale]
 		I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
 		parsed_locale.to_sym :
 		nil
 	end

end
