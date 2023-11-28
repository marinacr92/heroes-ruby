Rails.application.routes.draw do
  # resources :heroes, only: [:index, :show]
  root "dashboard#index"

  get "/", to: "dashboard#index"
  get "/heroes", to: "heroes#index"
  get "/heroes/:id_hero", to: "detail#show", constraint: { id_hero: /[0-9]/ }, as: "hero_detail"

end
