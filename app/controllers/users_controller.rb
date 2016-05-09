class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # @users = User.find_by(user_id: params[:id])
    @users = User.where(user_id: params[:id])
    # @users = User.where("user_id = ?", params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.where(:user_id => params[:user_id]).first_or_create(
      :user_id => params[:user_id],
      :display_name => params[:display_name],
      :email => params[:email],
      :img => params[:img],
    )
    # look in db for this id, if not there, then creates it
    #http://guides.rubyonrails.org/v3.2.8/active_record_querying.html#first_or_create

    @user.update(
      :display_name => params[:display_name],
      :email => params[:email],
      :img => params[:img],
    )
    # http://stackoverflow.com/questions/14599113/activerecord-update-a-record-if-exists-else-create/25497490#25497490
    # this updates the existing (as well as new) entry, in case the name, email, etc has changed


    # @user = User.new( user_id: params[:user_id], display_name: params[:display_name], email: params[:email], img: params[:img])

    # if @user.save
    render 'show', formats: [:json], handlers: [:jbuilder], status: 201
    # else
    #   render json: {error: "User could not be created."}, status: 422
    # end

  end

  def update
    @user = User.find(params[:user_id])

    if !params[:artist_one].nil?
      @user.update(
        :artist_one => params[:artist_one],
        :artist_two => params[:artist_two],
        :artist_three => params[:artist_three]
      )
    end

    if !params[:song_one].nil?
      @user.update(
        :song_one => params[:song_one],
        :song_two => params[:song_two],
        :song_three => params[:song_three]
      )
    end

    render 'show', formats: [:json], handlers: [:jbuilder], status: 201

    # if @user.update_attributes( name: params[:name], price: params[:price], active: params[:active] )
    #   render 'show', formats: [:json], handlers: [:jbuilder], status: 201
    # else
    #   render json: {error: "User could not be created."}, status: 422
    # end

  end

end
