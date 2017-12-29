Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'main#welcome'
  get 'schedule' => 'main#schedule'
  resources :rooms
end
