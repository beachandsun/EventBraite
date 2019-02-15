Rails.application.routes.draw do
  get 'avatars/create'
	root "events#index"
  devise_for :users
  resources :users do
  	resources :pictures, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
	resources :charges
  	resources :attendances
  	resources :avatars, only: [:create]
end

end
