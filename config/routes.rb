Rails.application.routes.draw do
  resources :users

  resources :projects do
    resources :todos do
      member do
        put :mark_as_done
        put :assign
      end
    end
  end

  resources :teams

  resources :events

  root to: 'pages#home'
  get "/:page", to: "pages#show"
end
