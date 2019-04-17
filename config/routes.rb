Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # : <snip>
  # APIコントローラへのルーティング
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :members, only: [:index, :show, :create]
    end
  end

  root to: 'home#index'
end
