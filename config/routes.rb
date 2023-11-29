Rails.application.routes.draw do
  root "dashboard#index"

  get "/", to: "dashboard#index"
  get "/heroes", to: "heroes#index"
  get "/heroes/:id_hero", to: "detail#show", constraint: { id_hero: /[0-9]/ }, as: "hero_detail"
  get "/heroes/:id_hero", to: "detail#edit"
  patch "/heroes/:id_hero", to: "detail#update"

end
