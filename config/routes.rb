Yoloconfessions::Application.routes.draw do
  devise_for :users
  resources :posts
  root 'posts#index'
  get 'admin', to: "admin#index"
  get 'general', to: "category#general"
  get 'nightclub', to: "category#nightclub"
  get 'workplace', to: "category#workplace"
  get 'school', to: "category#school"
  get 'relationships', to: "category#relationships"
  get 'hookups', to: "category#hookups"
  get 'thanks', to: "posts#thanks"
  get 'random', to: "posts#random"
end
