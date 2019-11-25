Rails.application.routes.draw do
  get 'sumanth/as'
  get 'welcome/index'
  get 'users/login', to: 'users#login'
  get 'users/list', to: 'users#list'
   get "users/log_out" => "users#logout"

resources :articles
  root 'welcome#index'

resources :articles do
  resources :comments
end


resources :users do
    post 'process_login', :on => :collection
 end
  #
  # resources :articles do
  #   resources :clients

end
