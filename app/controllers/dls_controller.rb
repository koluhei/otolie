class DlsController < ApplicationController
  def index
    @dl = Dl.new
    @song = Song.find(params[:song_id])
  end

  def create
    @dl = Dl.new(user_id: current_user.id, song_id: params[:song_id], token: params[:token])
    if @dl.valid?
      @song = Song.find(params[:song_id])
      pay_song
      @dl.save
      return redirect_to download_page_song_dls_path(params[:song_id])
    else
      render 'index'
    end
  end

  def download_page
    @song = Song.find(params[:song_id])
  end

  def download
    @song = Song.find(params[:song_id])
    send_file @song.audio.path
  end


  private

  def pay_song
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @song.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
