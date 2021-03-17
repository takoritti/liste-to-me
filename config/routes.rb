Rails.application.routes.draw do
  get 'musics/index'
  root to: "musics#index"

end
