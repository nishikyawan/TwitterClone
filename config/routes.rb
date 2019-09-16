Rails.application.routes.draw do
  root to: 'blogs#new'
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
