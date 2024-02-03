class Api::V1::WatchlistEntriesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_watchlist_entry, only: [:show, :update, :destroy]

  def index
    @watchlist_entries = policy_scope(current_user.watchlist_entries)
  end

    def show
      authorize @watchlist_entry
    end

  def create
    @watchlist_entry = current_user.watchlist_entries.build(watchlist_entry_params)
    authorize @watchlist_entry
    if @watchlist_entry.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    authorize @watchlist_entry
    if @watchlist_entry.update(watchlist_entry_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    authorize @watchlist_entry
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
