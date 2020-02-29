Rails.application.routes.draw do
  root to: 'pages#home'
  get 'calendario', to: 'pages#calendario', as: :calendario
  resources :certificados, except: [:new]
  resources :tecnicos
  resources :clientes do
    resources :certificados, only: [:new]
  end
>>>>>>> 3c4ba4e03b77930efea2c367a168028f86943bbd
  get 'proximas_fumigaciones', to: 'pages#proximas_fumigaciones', as: :proximas_fumigaciones
  get 'reportes', to: 'pages#reportes', as: :reportes
  get '/search' => 'pages#search', :as => 'search_page'
  get '/searchcertificado' => 'pages#searchcertificado', :as => 'searchcertificado_page'
  get '/searchtecnico' => 'pages#searchtecnico', :as => 'searchtecnico_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
