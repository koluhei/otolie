class SongsController < ApplicationController
  before_action :only_creator, except: [:index, :show, :search_index, :search]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_q, only: [:search_index, :search]

  def index
    @songs = Song.includes(:creator)
  end
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end


  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song.id)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to root_path
  end

  def search_index
    @songs = Song.includes(:creator)
  end

  def search
    @results = @q.result
  end



  private
  
  def set_song
    @song = Song.find(params[:id])
  end

  def move_to_index
    set_song
    unless current_creator.id == @song.creator.id
      redirect_to root_path
    end
  end
  
  def only_creator
    if user_signed_in?
      redirect_to root_path
    else 
      authenticate_creator!
    end
  end

  def song_params
    params.require(:song).permit(:title, :audio, :genre_id, :description, :price, :image).merge(creator_id: current_creator.id)
  end

  def set_q
    @q = Song.ransack(params[:q])
  end
end
