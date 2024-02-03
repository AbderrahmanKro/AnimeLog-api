json.array! @animes do |anime|
  json.extract! anime, :id, :title, :genre, :synopsis, :episode_count, :release_date
end
