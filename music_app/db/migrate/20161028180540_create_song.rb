class CreateSong < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :body
      t.integer :artist_id
    end
  end
end
