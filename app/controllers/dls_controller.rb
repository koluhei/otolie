class DlsController < ApplicationController
  def index
    @dl = Dl.new
    @song = Song.find(params[:song_id])
  end

  def create
    @dl.create(dl_params)
  end
  def dl_params
    params.merge(user_id: current_user.id, song_id: params[:song_id])
  end
end
