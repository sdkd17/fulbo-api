Rails.application.routes.draw do

  # get 'players/index'
  # get 'players/show'
  # get 'owners/index'
  # get 'owners/show'

  resources :users

  resources :players

  resources :locals do
    resources :courts  
  end

  resources :owners do
    resources :locals do
      resources :courts
    end
  end


  resources :courts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
