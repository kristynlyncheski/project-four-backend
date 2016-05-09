class SongsUsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @songs_users = SongsUsers.all
  end

  def gethistory
    # @songs = Song.joins(:songs_users).where("song_id in (select song_id from songs_users where selected = true and date_added_to_playlist is not null and user_id = ? )", params[:user_id])

    @songs_users = SongsUsers.joins("join songs on songs.song_id = songs_users.song_id").where("selected = true and date_added_to_playlist is not null and user_id = ?", params[:user_id]).order(date_added_to_playlist: :desc).limit(50)
    #http://guides.rubyonrails.org/active_record_querying.html#ordering

    render :json => @songs_users.to_json(:include => :songs)
    #http://stackoverflow.com/questions/27612802/how-to-join-tables-resulting-in-json-with-rails-4



  end

  def show
    @songs_users = SongsUsers.find(params[:id])
  end

  def new
    @songs_users = SongsUsers.new
  end

  def create
    @songs_users = SongsUsers.where(:user_id => params[:user_id],:song_id => params[:song_id]).first_or_create(
      :user_id => params[:user_id],
      :song_id => params[:song_id],
      :selected => params[:selected],
    )

    @songs_users.update(
      :selected => params[:selected],
    )

    render 'show', formats: [:json], handlers: [:jbuilder], status: 201


  end

  def addedPlaylist
    @songs_users = SongsUsers.where(user_id: params[:user_id], song_id: params[:song_id]).first

    @songs_users.update(
      :playlist_added_to => params[:playlist_added_to],
      :date_added_to_playlist => Time.new
    )
    render 'show', formats: [:json], handlers: [:jbuilder], status: 201


  end

end
