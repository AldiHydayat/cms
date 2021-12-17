Rails.application.routes.draw do
  devise_for :users

  root "homes#index"

  resources :forms do
    resources :answers, only: %i[index new create]
  end

  resources :questions do
    member do
      put "to_higher" => "questions#to_higher"
      put "to_lower" => "questions#to_lower"
      delete "remove" => "questions#remove"
    end
  end

  resources :options do
    member do
      put "to_higher" => "options#to_higher"
      put "to_lower" => "options#to_lower"
      delete "remove" => "options#remove"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
