class HeroesController < ApplicationController
  before_action :find_hero, only: [:show, :update, :destroy]
  def index
    @heroes = Hero.all
  end

  def show
  end

  def update
    @hero.update(name: params[:hero][:name])
      
  end

  def destroy

    begin
      @delete = Hero.find_by(id_hero: params[:id_hero])
      @delete.destroy
      flash[:success] = 'Hero successfully deleted'
      redirect_to hero_heroes_path
    rescue
    end
  end

  def create
    
    begin
      params.require([:id_hero, :name])
      @create = Hero.new(hero_params)
      @create.save
      flash[:success] = 'Hero successfully created'
      redirect_to hero_heroes_path

    rescue  StandardError => e
      flash[:error] = "Fields are missing"
      redirect_to new_hero_path
    end

  end

  private

  def find_hero
    @hero = Hero.find_by(id_hero: params[:id_hero])
  end

  def hero_params
    params.permit(:name, :id_hero, :other)
  end

  # def details_params
  #   params.require(:name).permit(:name, :other)
  # end
end
