class SongsUsers < ActiveRecord::Base
  belongs_to :songs, class_name: "Song", foreign_key: "song_id"
end
