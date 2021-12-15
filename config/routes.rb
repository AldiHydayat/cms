Rails.application.routes.draw do
  devise_for :users

  root "homes#index"

  resources :forms do
    resources :answers, only: %i[new create]
  end

  resources :question do
    member do
      put "to_higher" => "questions#to_higher"
      put "to_lower" => "questions#to_lower"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
