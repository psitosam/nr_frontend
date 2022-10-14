Rails.application.routes.draw do
root 'welcome#index'
# get '/healthcare', to: 'searches#index'
# get '/opensource', to: 'searches#index'
# get '/nasa', to: 'searches#index'
resources :searches, only: [:index]
end
