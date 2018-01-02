Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'main#welcome'
  get 'schedule', to: 'main#schedule'
  get 'combined', to: 'main#combined'
  get 'stream', to: 'main#stream'
  resources :rooms
end
