Rails.application.routes.draw do
  
  get '/messages', to: 'messages#index', as: 'messages'
  post '/send_message', to: 'messages#send_message', as: 'send_message'
  post '/receive_message', to: 'messages#receive_message', as: 'receive_message'
    
  root to: 'messages#index'
end
