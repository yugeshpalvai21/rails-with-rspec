Rails.application.routes.draw do
  root 'pages#home'
  
  # Example of shallow nesting
  # resources :posts do
  #   resources :comments, shallow: true
  # end
end
