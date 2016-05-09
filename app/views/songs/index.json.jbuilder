json.songs @songs do |song|

  json.song_id song.song_id
  json.song_title song.song_title
  json.preview song.preview
  json.album song.album
  json.img song.img
  json.artist_name song.artist_name
  json.artist_id song.artist_id


end
