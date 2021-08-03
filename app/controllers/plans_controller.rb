class PlansController < ApplicationController
  def index
    @creator = Creator.find(params[:creator_id])
  end
end
