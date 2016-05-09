json.songsUsers @songsUsers do |songUser|

  json.user_id songUser.user_id
  json.song_id songUser.song_id
  json.playlist_added_to s.playlist_added_to
  json.date_added_to_playlist s.date_added_to_playlist
  json.selected s.selected

end
