class CreateAnimes < ActiveRecord::Migration[7.0]
  def change
    create_table :animes do |t|
      t.string :title
      t.string :genre
      t.text :synopsis
      t.integer :episode_count
      t.date :release_date

      t.timestamps
    end
  end
end
