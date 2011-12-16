class BedsController < ApplicationController
  before_filter :login_required
  load_and_authorize_resource :garden
  load_and_authorize_resource :bed, :through => :garden

  def show
    puts "show"
  end

  def authorize! one, two
    super one, two
  end
  # called before render the form
  def new
    @possible_states = init_possible_states
  end

  def edit
    @possible_states = init_possible_states
    @possible_plants = @bed.possible_plants.collect{|plant| [plant.name, plant.id]}
  end

  def update
    if @bed.update_attributes(params[:bed])
      redirect_to [@garden, @bed], :notice  => "Successfully updated garden."
    else
      render :action => 'edit'
    end
  end

  # called after submitting the new form
  def create
    @possible_states = init_possible_states
    @bed.garden = @garden
      if @bed.save
        redirect_to(@garden, :notice => 'Bed was successfully created.')
      else
        render :action => "new"
      end
  end


  def update_add_plants
    add_selected_plants()
    #redirect_to([@garden, @bed], :notice => 'plant was added')
    @possible_plants = @bed.possible_plants.collect{|plant| [plant.name, plant.id]}
    render :action => "add_plants"
  end

  def add_plants
    @possible_plants = @bed.possible_plants.collect{|plant| [plant.name, plant.id]}
  end

  def destroy
    puts "destroy"
    @bed.destroy
    redirect_to(@garden)
  end

  def move_bed
    position = params[:position]
    id = params[:id]
    @bed.pos_left = position[:left]
    @bed.pos_top = position[:top]
    @bed.save
    render :nothing => true
  end

  private

  def init_possible_states
    FieldState::all_states.collect{|state| [state.id, state.id]}
  end

  def add_selected_plants
    plant_ids=params[:selected_plants][:plant_ids].collect { |s| s.to_i }
    @bed.plant_ids = @bed.plant_ids.concat plant_ids
  end

end
