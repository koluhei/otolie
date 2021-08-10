class CreatorsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  
  def index
    @creators = Creator.all
  end

  def show
    @creator = Creator.find(params[:id])
    @songs = @creator.songs
  end

  def search
    @results = @q.result
  end

  private
  
  def set_q
    @q = Creator.ransack(params[:q])
  end
end
