class PlansController < ApplicationController

  def index
    @creator = Creator.find(params[:creator_id])
    @plans = Plan.all
  end

  def new
    @creator = Creator.find(params[:creator_id])
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to creator_plans_path(current_creator.id)
    else
      render :new
    end
  end

  def edit
    @creator = Creator.find(params[:creator_id])
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to creator_plans_path(current_creator.id)
    else
      render :edit
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to creator_plans_path(current_creator.id)
  end

  private
  def plan_params
    params.require(:plan).permit(:course, :description, :price, :delivery).merge(creator_id: current_creator.id)
  end
end
