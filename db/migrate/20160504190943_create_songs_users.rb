class CreateSongsUsers < ActiveRecord::Migration
  def change
    # create_join_table :users, :songs, {:id => false} do |t|
    create_join_table :users, :songs do |t|

      t.primary_key :id
      t.string :user_id
      t.string :song_id
      # t.index :user_id
      # t.index :song_id
      t.boolean :selected
      # t.boolean :added_to_playlist
      t.datetime :date_added_to_playlist
      t.string :playlist_added_to
      # t.datetime :created_date

      t.timestamps null: false
    end
    add_index(:songs_users, [:user_id,:song_id], :unique => true)

  end
end
