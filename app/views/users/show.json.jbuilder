json.users @users do |user|

  json.user_id user.user_id
  json.display_name user.display_name
  json.email user.email
  json.img user.img
  json.artist_one user.artist_one
  json.artist_two user.artist_two
  json.artist_three user.artist_three
  json.song_one user.song_one
  json.song_two user.song_two
  json.song_three user.song_three

end
