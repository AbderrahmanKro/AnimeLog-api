json.watchlist_entry do
  json.extract! @watchlist_entry, :id, :user_id, :anime_id
  json.anime do
    json.extract! @watchlist_entry.anime, :id, :title, :genre, :synopsis, :episode_count, :release_date
  end
  json.status @watchlist_entry.status
end
