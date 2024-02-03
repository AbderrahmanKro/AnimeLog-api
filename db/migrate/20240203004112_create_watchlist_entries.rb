class CreateWatchlistEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :watchlist_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :anime, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
