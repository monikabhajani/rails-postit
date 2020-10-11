class ApplicationController < ActionController::Base
  
  respond_to :html, :js
  
  protect_from_forgery with: :exception    # Prevent CSRF attacks by raising an exception.

  before_action :authenticate_user!	
  before_action :set_locale


  #def set_locale
  	#puts "=============================set_locale=================="
  	#puts params[:locale].inspect
  	#if !params[:locale].nil? && !params[:locale].blank?
  	#if user_signed_in?
  	#	I18n.locale = current_user.language
  	#else
    #	I18n.locale = params[:locale] || locale_from_header || I18n.default_locale
    #end
    #else
    #	I18n.locale = :en
    #end
    #puts I18n.locale.inspect
  #end 

#  def locale_from_header
  #		request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
 # end


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
