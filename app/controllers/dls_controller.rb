class DlsController < ApplicationController
  def index
    @dl = Dl.new
    @song = Song.find(params[:song_id])
  end

end
