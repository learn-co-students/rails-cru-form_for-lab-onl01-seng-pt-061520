Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :songs, only: [:index, :show, :new, :edit, :create, :update, :delete]
  patch '/songs/:id', to: 'songs#update'
  resources :artists, only: [:index, :show, :new, :edit, :create, :update, :delete]
  patch '/artists/:id', to: 'artist#update'
  resources :genres, only: [:index, :show, :new, :edit, :create, :update, :delete]
  patch '/genres/:id', to: 'genres#update'
  
end
