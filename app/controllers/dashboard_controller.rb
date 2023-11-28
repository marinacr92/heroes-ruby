class DashboardController < ApplicationController
  def index
    @dashboards = Hero.limit(4)
  end
end
