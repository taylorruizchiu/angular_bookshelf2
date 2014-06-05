Rails.application.routes.draw do
  root 'pages#index'
  resources :books, except: [:new, :edit]
end

# Prefix Verb   URI Pattern          Controller#Action
#  books GET    /books(.:format)     books#index
#        POST   /books(.:format)     books#create
#   book GET    /books/:id(.:format) books#show
#        PATCH  /books/:id(.:format) books#update
# #        PUT    /books/:id(.:format) books#update
#        DELETE /books/:id(.:format) books#destroy