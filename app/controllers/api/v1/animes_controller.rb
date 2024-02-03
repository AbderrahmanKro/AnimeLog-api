class Api::V1::AnimesController < Api::V1::BaseController
  before_action :set_anime, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @animes = Anime.all
  end

  def show
  end

  private

  def set_anime
    @anime = Anime.find(params[:id])
  end
end
