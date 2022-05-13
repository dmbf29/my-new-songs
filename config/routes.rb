Rails.application.routes.draw do
  get '/search', to: 'songs#search', as: :search_songs
  get '/songs/named/:name', to: 'songs#name', as: :named_songs

  # verb, path, to: 'controller#action', as: :prefix
  get '/songs', to: 'songs#index', as: :songs

  get '/songs/new', to: 'songs#new', as: :new_song
  post '/songs', to: 'songs#create'

  get '/songs/:id', to: 'songs#show', as: :song


  get '/songs/:id/edit', to: 'songs#edit', as: :edit_song
  patch '/songs/:id', to: 'songs#update'

  delete '/songs/:id', to: 'songs#destroy'

  resources :songs do
    resources :reviews, only: [:new, :create]
  end
end
