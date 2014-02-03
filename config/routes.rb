Yoloconfessions::Application.routes.draw do
  devise_for :users
  resources :posts
  root 'posts#index'
  get 'admin', to: "admin#index"
end
