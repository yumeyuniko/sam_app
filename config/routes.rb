Rails.application.routes.draw do
  root 'static_pages#home'
  # root 'application#hello'
  
  get 'static_pages/home'
  get 'static_pages/help'
  
  get 'static_pages/about'

end
