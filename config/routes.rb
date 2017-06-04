Rails.application.routes.draw do
  resources :users

  resources :projects do
    resources :todos do
      member do
        put :mark_as_done
      end
    end
  end

  resources :teams

  resources :events
end
