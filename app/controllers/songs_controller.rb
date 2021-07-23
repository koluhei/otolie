class SongsController < ApplicationController
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


  private
  def song_params
    params.require(:song).permit(:title, :audio, :genre_id, :description, :price, :image).merge(creator_id: current_creator.id)
  end
end
