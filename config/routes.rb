Rails.application.routes.draw do


  devise_for :users


  devise_scope :user do
    authenticated :user do
      root 'actions#ranking', as: :authenticated_root
      get 'ranking' => 'actions#ranking'
      get 'pages/about'
      resources :pages, only: [:new, :create, :show]
      resources :sports, only: [:index, :new, :create, :show]
      resources :actions, only: [:new, :create, :destroy]
      resources :employees, only: [:new, :create]
      # post 'prizes/index' => 'prizes#get_random_ticket'
      # post 'prizes/show' => 'prizes#save_ticket_to_prize'
      # post 'destroy' => 'prizes#destroy', as: :destroy
      # post 'update' => 'tickets#update'
      # get 'list' => 'prizes#list'
      # root 'prizes#index', as: :authenticated_root
    end


    unauthenticated do
      root to: 'actions#ranking', as: :unauthenticated_root
      get 'ranking' => 'actions#ranking'

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
