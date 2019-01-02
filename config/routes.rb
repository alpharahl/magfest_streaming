Rails.application.routes.draw do
  get 'setup/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'isp', to: 'setup#index'
  get 'schedule', to: 'main#schedule'
  get 'combined', to: 'main#combined'
  get 'stream', to: 'main#stream'

  get 'admin/setup', to: 'devices#setup'
  get 'admin/channels', to: 'devices#channels'
  get 'api/admin/devices', to: 'devices#setup_list'
  get 'api/admin/populate', to: 'rooms#populate'
  get 'admin/events', to: 'rooms#streaming'
  get 'api/admin/events', to: 'rooms#index'
  patch 'api/rooms/:id', to: 'rooms#update_room'
  get 'api/rooms/current', to: 'rooms#current'
  get '/api/rooms/streamable', to: 'rooms#streamable'

  resources :devices, only: [:destroy, :update, :index]

  get 'display/:id', controller: :main, action: :welcome
  resources :rooms
end
