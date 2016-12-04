class ClientDashboardController < ApplicationController
  def index
    @episode = Episode.all
  end
end
