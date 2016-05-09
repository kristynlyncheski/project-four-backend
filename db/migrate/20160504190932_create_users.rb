class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :primary_key => :user_id do |t|

      t.string :display_name
      t.string :email
      t.string :img
      t.string :artist_one
      t.string :artist_two
      t.string :artist_three
      t.string :song_one
      t.string :song_two
      t.string :song_three

      t.timestamps null: false
    end
  end
end
