Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root 'worlds#home'

#resources makes the
#index, new, create, show, edit, 
#update, and destroy routes/actions
resources :worlds do
  resources :plots
  resources :characters 
end 

resources :plots
resources :characters 

#view world with most plots 
get 'worlds/most-plots' => 'worlds#show'

end
