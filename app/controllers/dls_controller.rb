class DlsController < ApplicationController
  before_action :cannot_pay_again, only: [:index,:create]
  before_action :cannnot_download_except_buyer, only: [:download_page, :download]

  def index
    @dl = Dl.new
    set_song
  end

  def create
    @dl = Dl.new(user_id: current_user.id, song_id: params[:song_id], token: params[:token])
    if @dl.valid?
      set_song
      pay_song
      @dl.save
      return redirect_to download_page_song_dls_path(params[:song_id])
    else
      render 'index'
    end
  end

  def download_page
    set_song
  end

  def download
    set_song
    send_file @song.audio.path
  end


  private

  def cannot_pay_again
    if (user_signed_in? && Dl.where(song_id: params[:song_id], user_id: current_user.id).present?) || (creator_signed_in?)
      redirect_to song_path(params[:song_id])
    end
  end

  def cannnot_download_except_buyer
    unless user_signed_in? && Dl.where(song_id: params[:song_id], user_id: current_user.id).present?
      redirect_to root_path
    end
  end

  def pay_song
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @song.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def set_song
    @song = Song.find(params[:song_id])
  end
end
