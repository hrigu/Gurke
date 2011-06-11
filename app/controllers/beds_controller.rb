class BedsController < ApplicationController
before_filter :login_required
before_filter :find_garden

  def index
    @beds = Bed.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @beds }
    end
  end

  def show
    @bed = @garden.beds.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bed }
    end
  end

  # called before render the form
  def new
    @bed = Bed.new
    @possible_states = FieldState::all_states.collect{|state| [state.id, state.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bed }
    end
  end

  # GET /beds/1/edit
  def edit
    @bed = @garden.beds.find(params[:id])
    @possible_states = FieldState::all_states.collect{|state| [state.id, state.id]}
    @possible_plants = @bed.possible_plants.collect{|plant| [plant.name, plant.id]}

  end

  # called after submitting the new form
  def create
    @bed = Bed.new(params[:bed])
    @bed.garden = @garden
    respond_to do |format|
      if @bed.save
        format.html { redirect_to(@garden, :notice => 'Bed was successfully created.') }
        format.xml  { render :xml => @bed, :status => :created, :location => @bed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /beds/1
  # PUT /beds/1.xml
  def update
    @bed = @garden.beds.find(params[:id])
    plant_ids=params[:selected_plants][:plant_ids].collect { |s|s.to_i  }
    puts plant_ids
    @bed.plant_ids = @bed.plant_ids.concat plant_ids

    @possible_plants = @bed.possible_plants.collect{|plant| [plant.name, plant.id]}

    respond_to do |format|
      if @bed.update_attributes(params[:bed])
        format.html { redirect_to(@garden, :notice => 'Bed was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @garden.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /beds/1
  # DELETE /beds/1.xml
  def destroy
    @bed = @garden.beds.find(params[:id])
    @bed.destroy

    respond_to do |format|
      format.html { redirect_to(@garden) }
      format.xml  { head :ok }
    end
  end

  private
  def find_garden
    @garden = Garden.find(params[:garden_id])
  end
end
