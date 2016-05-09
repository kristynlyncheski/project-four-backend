class Song < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :songs_users, class_name: "SongsUsers", foreign_key: "song_id"
  self.primary_key = "song_id"
  # http://stackoverflow.com/questions/18056162/getting-unknown-primary-key-for-table-while-the-id-is-there
end
