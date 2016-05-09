json.songs_users @songs_users do |s|

  json.user_id s.user_id
  json.song_id s.song_id
  json.playlist_added_to s.playlist_added_to
  json.date_added_to_playlist s.date_added_to_playlist

end
