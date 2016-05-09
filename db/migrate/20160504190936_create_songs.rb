class CreateSongs < ActiveRecord::Migration
  def change
    # create_table :songs, :primary_key => :song_id do |t|
    create_table :songs, {:id => false} do |t|

      t.string :song_id
      t.string :song_title
      t.string :artist_name
      t.string :artist_id
      t.string :album
      t.string :img
      t.string :preview

      t.timestamps null: false
    end
    add_index :songs, :song_id, :unique => true
    
  end
end
