Rails.application.routes.draw do
  resources :songs, only: [:show, :new, :edit, :update, :create]
  resources :genres, only: [:show, :new, :edit, :update, :create]
  resources :artists, only: [:show, :new, :edit, :update, :create]
end
