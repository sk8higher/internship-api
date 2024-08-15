Rails.application.routes.draw do
  resources :schools, only: [] do
    resources :groups
  end
end
