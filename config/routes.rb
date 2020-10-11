Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

		  devise_for :users
		  
		  root 'posts#index', as: 'home'

		  get 'aboutus' => 'users#aboutus', as: 'about'

		  resources :posts

	  end

  
end
