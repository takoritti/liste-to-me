Rails.application.routes.draw do
  devise_for :users
  get 'musics/index'
  root to: "musics#index"

end
