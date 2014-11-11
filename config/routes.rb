Hemmingway::Engine.routes.draw do
  root 'pages#index'
  get '/:id' => 'pages#show'

  resources :pages

end
