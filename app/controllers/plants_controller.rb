class PlantsController < ApplicationController
  include PlantsHelper

  #see http://rdoc.info/github/ryanb/cancan/master/CanCan/ControllerAdditions/ClassMethods:load_resource
  load_and_authorize_resource

  # GET /calculate_harvest_time
  def calculate_harvest_time
 #   @plant = Plant.find(params[:id])
    @selected_seed_day = params[:harvest_time_calculation][:seed_day]
    @selected_seed_month =  params[:harvest_time_calculation][:seed_month]
    seed_time = DateInYear.new day_from_rendered_seed_time(@selected_seed_day),month_from_rendered_seed_time(@selected_seed_month)
    minimal_harvest_time = @plant.calculate_minimum_harvest_time seed_time
    maximal_harvest_time = @plant.calculate_maximum_harvest_time seed_time
    @harvest_time = render_harvest_time(minimal_harvest_time, maximal_harvest_time)
    render :action => "show"
  end

  # GET /plants
  # GET /plants.xml
  def index
    #@plant is set by cancan before filter load_and_authorize_resource using Plant.accessible_by(current_ability).
    # see: http://rdoc.info/github/ryanb/cancan/master/CanCan/ModelAdditions/ClassMethods:accessible_by
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plants }
    end
  end

  def show
    #@plant is set by cancan before filter load_and_authorize_resource using find(params[:id]
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plant }
    end
  end

  def new
    #@plant is set by cancan before filter load_and_authorize_resource using find(params[:id]
    @families = Family.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plant }
    end
  end

  def edit
    #@plant is set by cancan before filter load_and_authorize_resource using find(params[:id]
    @families = Family.all
  end

  def create
    #@plant is set by cancan before filter load_and_authorize_resource using new(params[:id]
    respond_to do |format|
      if @plant.save
        format.html { redirect_to(@plant, :notice => 'Plant was successfully created.') }
        format.xml  { render :xml => @plant, :status => :created, :location => @plant }
      else
        @families = Family.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @plant.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    #@plant is set by cancan before filter load_and_authorize_resource using find(params[:id]
    respond_to do |format|
      if @plant.update_attributes(params[:plant])
        format.html { redirect_to(@plant, :notice => 'Plant was successfully updated.') }
        format.xml  { head :ok }
      else
        @families = Family.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plant.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    #@plant is set by cancan before filter load_and_authorize_resource using find(params[:id]
    @plant.destroy

    respond_to do |format|
      format.html { redirect_to(plants_url) }
      format.xml  { head :ok }
    end
  end
end
