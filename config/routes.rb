Rails.application.routes.draw do
  require 'jsonapi/routing_ext'

  jsonapi_resources :contents
  jsonapi_resources :episodes
  jsonapi_resources :movies
  jsonapi_resources :purchases
  jsonapi_resources :purchase_options
  jsonapi_resources :seasons
  jsonapi_resources :users
end
