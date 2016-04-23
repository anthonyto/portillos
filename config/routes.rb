Rails.application.routes.draw do
  
  resources :messages, only: [:index, :new] do
    collection do 
      post 'outbound'
      post 'inbound'
    end
  end
  
  get '/info', to: 'application#info', as: 'info'
    
  root to: 'messages#index'
end
