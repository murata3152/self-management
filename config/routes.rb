Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resource :posts, only:[:index, :new, :create]
end
