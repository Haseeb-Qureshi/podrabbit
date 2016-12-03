class PodcastsController < ApplicationController

  def index
  	@podcasts = Podcast.all
  end
  def new 


  end
  def create
	params.require(:name)
  	name = params[:name]
  	Podcast.create(name: name)
  	redirect_to podcasts_path
  end

end
