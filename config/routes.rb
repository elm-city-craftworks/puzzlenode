Puzzlenode::Application.routes.draw do
  root :to => 'puzzles#index'

  match '/auth/:provider/callback' => 'sessions#create', :via => [:get, :post]
  get '/auth/failure'              => 'sessions#failure'
  get '/logout'                    => 'sessions#destroy', :as => 'logout'
  get '/login'                     => 'sessions#new',     :as => 'login'

  resources :puzzles do
    resources :comments,    :module => "puzzles"
    resources :submissions, :module => "puzzles"
  end

  get '/tags/:tag' => 'puzzles#tag',     :as => "tag"
  get '/users/settings' => 'users#edit', :as => "user_settings"

  resources :users do
    resources :submissions, :controller => "submissions", :module => "users" do
      match :rate, :on => :member, :via => [:put, :post]
    end
  end

  resources :announcements

  get '/leaderboard' => "leaderboard#index"
  get '/about'       => "home#about"

  namespace :admin do
    resources :users
    resources :puzzles
    resources :announcements

    get "/" => 'puzzles#index', :as => 'admin'
  end

  get "slugger" => "slugger#index", :as => "slugger"
end
