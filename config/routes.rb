PageFetcher::Application.routes.draw do

  resources :key_masters, only: [:new]
  resources :pages, only: %i|new show create|

  root to: 'pages#new'

  mount Apidae::Hive => "/"

end
