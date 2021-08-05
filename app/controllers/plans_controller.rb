class PlansController < ApplicationController
  
  before_action :only_creator_can_create_plan, except: :index
  before_action :set_plan, only: [:edit, :update, :destroy]


  def index
    @creator = Creator.find(params[:creator_id])
    @plans = @creator.plans
  end

  def new
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
  end

  def update
    if @plan.update(plan_params)
      redirect_to creator_plans_path(current_creator.id)
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy
    redirect_to creator_plans_path(current_creator.id)
  end

  private
  def plan_params
    params.require(:plan).permit(:course, :description, :price, :delivery).merge(creator_id: current_creator.id)
  end

  def only_creator_can_create_plan
    @creator = Creator.find(params[:creator_id])
    if user_signed_in?
      redirect_to root_path
    elsif creator_signed_in? && current_creator.id != @creator.id
      redirect_to root_path
    else
      authenticate_creator!
    end
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

end
