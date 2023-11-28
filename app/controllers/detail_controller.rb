class DetailController < ApplicationController
  def show
    @details = Hero.find_by(id_hero: params[:id_hero])
  end
end
