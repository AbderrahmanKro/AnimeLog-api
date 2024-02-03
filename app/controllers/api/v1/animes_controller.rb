class Api::v1::AnimesController < Api::v1::BaseController
  before_action :set_anime, only: [:show]

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
