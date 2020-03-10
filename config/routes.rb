Rails.application.routes.draw do
  root to: 'pages#home'
 
  resources :tecnicos 
  resources :certificados, except: [:new]
  resources :quejas, except: [:new]

  resources :clientes do
    resources :certificados, only: [:new]
    resources :quejas, only: [:new]
  end
  
  get 'calendario', to: 'pages#calendario', as: :calendario
  get 'proximas_fumigaciones', to: 'pages#proximas_fumigaciones', as: :proximas_fumigaciones
  get 'reportes', to: 'pages#reportes', as: :reportes
  get '/search' => 'pages#search', :as => 'search_page'
  get '/searchcertificado' => 'pages#searchcertificado', :as => 'searchcertificado_page'
  get '/searchtecnico' => 'pages#searchtecnico', :as => 'searchtecnico_page'
  get '/searchqueja' => 'pages#searchqueja', :as => 'searchqueja_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
