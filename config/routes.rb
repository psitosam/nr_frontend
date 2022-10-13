Rails.application.routes.draw do
root 'welcome#index'
get '/healthcare', to: 'healthcare#index'
get '/opensource', to: 'opensource#index'
get '/nasa', to: 'nasa#index'
end
