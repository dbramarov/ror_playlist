Rails.application.routes.draw do

  get 'main' => 'users#index'

  post 'users/register' => 'users#register'

  post 'users/login' => 'users#login'

  delete 'users/logout' => 'users#logout'

  get 'songs' => 'songs#index'

  get 'songs/:id' => 'songs#show'

  post 'add' => 'songs#add'

  post 'count/:id' => 'counts#add'

  get 'user/:id' => 'users#show'

end
