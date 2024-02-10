class Api::V1::AnimesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_anime, only: [:show]
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @animes = policy_scope(Anime)
  end

  def show
    authorize @anime
  end

  private

  def set_anime
    @anime = Anime.find(params[:id])
  end
end
