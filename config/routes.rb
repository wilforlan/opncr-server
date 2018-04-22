Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    post '/actors', to: 'actors#create'
    get '/actors/test_enc', to: 'actors#test'
    post '/actors/pull_loan_record_request', to: 'actors#pull_loan_record_request'
    post '/actors/approve_loan_record_request', to: 'actors#approve_loan_record_request'
    get '/actors/get_pull_loan_record_request/:address', to: 'actors#get_pull_loan_record_request'

    get '/users/:id', to: 'users#show'
    post '/users', to: 'users#create'

  end
end
