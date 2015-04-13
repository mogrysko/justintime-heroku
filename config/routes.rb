Rails.application.routes.draw do
  root to: 'session#show'
  post '/session' => 'session#create'
  resources :terms do
    member do
      post :add
      post :remove
    end
  end
  resources :courses
  get 'tags/:tag', to: 'terms#index', as: :tag
  get 'addtags/:tag', to: 'terms#addterms', as: :addtag
  get '/add' => 'terms#addterms'
end
