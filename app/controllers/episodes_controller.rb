class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]

  def index
    @episodes = Episode.all
    render json: @episodes
  end

  def show
    render json: @episode
  end

  # def new
  # end
  #
  # def edit
  # end
  #
  # def create
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end

  private

    def set_episode
      @episode = Episode.find(params[:id])
    end

    def episode_params
      params.require(:episode).permit(:number, :title)
    end
end
