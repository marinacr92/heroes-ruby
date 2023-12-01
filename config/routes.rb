Rails.application.routes.draw do
  root "dashboard#index"

  get "/", to: "dashboard#index"
  get "/heroes", to: "heroes#index", as: "hero_heroes"
  get "/heroes/detail", to: "heroes#show", constraint: { id_hero: /[0-9]/ }, as: "hero_detail"
  get "/heroes/create", to: "heroes#form", as: "new_hero"
  patch "/heroes/detail", to: "heroes#update"
  post "/heroes/create", to: "heroes#create", as: "new_hero_create"
  delete "/heroes", to: "heroes#destroy", as: "delete_hero"

end
