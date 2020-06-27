Rails.application.routes.draw do
  get 'todos/index'
  get 'users/index'
  get 'user/index'
  devise_for :users
  get 'todo/index'
  root to: "todo#index"
end
