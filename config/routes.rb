Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root 'worlds#home'

resources :worlds do
  resources :plots
  resources :characters 
end 

resources :plots
resources :characters 

#view world with most plots 
get 'worlds/most-plots' => 'worlds#show'


#dynamic error pages
get 'errors/not_found'
get 'errors/internal_server_error'


match "/404", :to => "errors#not_found", :via => :all
match "/500", :to => "errors#internal_server_error", :via => :all

end
