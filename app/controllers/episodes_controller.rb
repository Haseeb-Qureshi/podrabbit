class EpisodesController < ApplicationController
	def index
		podcast = Podcast.find(params[:podcast_id])
		@episodes = podcast.episodes.all
	end
end
