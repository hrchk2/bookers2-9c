Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:"homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources:book_comments,only: [:create,:destroy]
  end
  resources :users, only: [:index,:show,:edit,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups do
    get "join" => "groups#join"
    delete "group_destroy" => "groups#group_destroy"
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end
end
