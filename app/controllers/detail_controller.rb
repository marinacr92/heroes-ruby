class DetailController < ApplicationController
  before_action :find_hero, only: [:show, :update]

  def show
    @details = Hero.find_by(id_hero: params[:id_hero])
  end
  def edit
    @details = Hero.find_by(id_hero: params[:id_hero])
    render :edit
  end

  def update
    @hero.update(name: params[:hero][:name])
    render json: @hero
  end

  private

  def find_hero
    @hero = Hero.find_by(id_hero: params[:id_hero])
  end

  def details_params
    params.require(:name).permit(:name, :other)
  end

end
