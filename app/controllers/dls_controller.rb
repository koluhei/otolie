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
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def pay_song
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @song.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
