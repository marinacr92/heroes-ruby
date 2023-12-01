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
    @delete = Hero.find_by(id_hero: params[:id_hero])
    @delete.destroy
    
    respond_to do |format|
      format.html { redirect_to hero_heroes_path, notice: 'Heroe eliminado exitosamente.'}
      format.json { head :no_content }    
    end
  end

  def create
    # @create = Hero.new(id_hero: params[:id_hero], name: params[:name], other: params[:other])
    
    # params.require([:id_hero, :name])
    @create = Hero.new(id_hero: params[:id_hero], name: params[:name], other: params[:other])
    
    if @create.save
      redirect_to hero_heroes_path, notice: 'El personaje se ha creado'
    else 
      render :index
    end
  end

  private

  def find_hero
    @hero = Hero.find_by(id_hero: params[:id_hero])
  end

  # def hero_params
  #   params.permit(:name, :id_hero, :other)
  # end

  # def details_params
  #   params.require(:name).permit(:name, :other)
  # end
end
