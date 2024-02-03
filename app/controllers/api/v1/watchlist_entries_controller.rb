class Api::V1::WatchlistEntriesController < Api::V1::BaseController
  before_action :set_watchlist_entry, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    current_user = User.first
    @watchlist_entries = current_user.watchlist_entries
  end

  def show
  end

  def create
    @watchlist_entry = current_user.watchlist_entries.build(watchlist_entry_params)
    if @watchlist_entry.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @watchlist_entry.update(watchlist_entry_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @watchlist_entry.destroy
    head :no_content
  end

  private

  def set_watchlist_entry
    @watchlist_entry = current_user.watchlist_entries.find(params[:id])
  end

  def watchlist_entry_params
    params.require(:watchlist_entry).permit(:user_id, :anime_id)
  end

  def render_error
    render json: { errors: @watchlist_entry.errors.full_messages },
      status: :unprocessable_entity
  end
end
