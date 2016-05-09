class SongsController < ApplicationController

  def index
    # if params[:selected]
    #   @songs = Song.where("song_id in (select song_id from songs_users where selected = true and date_added_to_playlist is null and user_id = '126006237')")
    #   puts "in the first block"
    # else
      @songs = Song.all
    #   puts "in second block"
    #   puts params[:user_id]
    # end
  end

  def getsaved
    @songs = Song.where("song_id in (select song_id from songs_users where selected = true and date_added_to_playlist is null and user_id = ? )", params[:user_id])
  end
  #http://stackoverflow.com/questions/9779706/how-to-add-parameter-to-index-action-method/18448770#18448770

  # def gethistory
  #   # @songs = Song.joins(:songs_users).where("song_id in (select song_id from songs_users where selected = true and date_added_to_playlist is not null and user_id = ? )", params[:user_id])
  #   @songs = Song.joins("join songs_users on songs.song_id = songs_users.song_id").where("selected = true and date_added_to_playlist is not null and user_id = ?", params[:user_id])
  #
  #   # puts @songs.first().date_added_to_playlist
  #   render :json => @songs.to_json(:include => :songs_users)
  #
  # end

  def show
    @songs = Song.find(params[:song_id])
  end

  def create
    @song = Song.where(:song_id => params[:song_id]).first_or_create(
      :song_id => params[:song_id],
      :song_title => params[:song_title],
      :artist_name => params[:artist_name],
      :artist_id => params[:artist_id],
      :album => params[:album],
      :img => params[:img],
      :preview => params[:preview]
    )

    @song.update(
      :song_title => params[:song_title],
      :artist_name => params[:artist_name],
      :artist_id => params[:artist_id],
      :album => params[:album],
      :img => params[:img],
      :preview => params[:preview]
    )

    render 'show', formats: [:json], handlers: [:jbuilder], status: 201

  end

end
