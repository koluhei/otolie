class CreatorsController < ApplicationController
  def show
    @creator = Creator.find(params[:id])
    @songs = @creator.songs
  end

end
