class DashboardController < ApplicationController
  def index
    @dashboards = Hero.limit(4).order(:id_hero)
  end
end
