Hemmingway.parent_engine.routes.draw do
  get 'hemmingway', to: 'hemmingway/pages#index'

  namespace :hemmingway do
    resources :pages do
      get   'styles', on: :collection, formats: [:json]
      post  'preview', on: :collection
      put   'preview', on: :collection
      patch 'preview', on: :collection
    end
  end

  if Hemmingway.home_page?
    get "/#{Hemmingway.home_page}", to: redirect('/')
    root to: 'hemmingway/pages#show', id: Hemmingway.home_page
  end

  if Hemmingway.routes?
    get Hemmingway::RouteMatcher.match_routes
  end

end