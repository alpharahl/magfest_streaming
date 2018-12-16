Rails.application.routes.draw do
  get 'setup/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'setup#index'
  get 'schedule', to: 'main#schedule'
  get 'combined', to: 'main#combined'
  get 'stream', to: 'main#stream'

  get 'display/:id', controller: :main, action: :welcome
  resources :rooms
end
