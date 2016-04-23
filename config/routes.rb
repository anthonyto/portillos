Rails.application.routes.draw do
  
  resources :messages, only: [:index, :new] do
    collection do 
      get 'outbound'
      post 'inbound'
    end
  end
    
  root to: 'messages#index'
end
