class HeroesController < ApplicationController
  def index
    @heroes = Hero.all
  end
end
