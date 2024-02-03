class Anime < ApplicationRecord
  has_many :watchlist_entries, dependent: :destroy
  has_many :users, through: :watchlist_entries
end
