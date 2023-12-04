class HeroesController < ApplicationController
  before_action :find_hero, only: [:show, :update]
  def index
    @heroes = Hero.all.order(:id_hero)
  end

  def show
  end

  def update
    begin
      params.require(:name)
      @hero.update(update_params)
      flash[:success] = "Hero's name successfully updated"
      redirect_to hero_heroes_path
    rescue  StandardError => e
      flash[:error] = "Fields are missing"
      redirect_to update_hero_path
    end
  end

  def destroy

    begin
      @delete = Hero.find_by(id_hero: params[:id_hero])
      @delete.destroy
      flash[:success] = 'Hero successfully deleted'
      redirect_to hero_heroes_path
    end
  end

  def create
    begin
        params.require([:id_hero, :name])
        @create = Hero.new(hero_params)
      
      if @create.save 
        flash[:success] = 'Hero successfully created'
        redirect_to hero_heroes_path
      else
        flash[:error] = 'Id already exists'
        redirect_to new_hero_path
      end
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

  def update_params
    params.permit(:name)
  end
end
