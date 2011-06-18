class FamiliesController < ApplicationController

  #see plants_controller for details
  load_and_authorize_resource

#  def index
#  end

  #not necessary, since there is a view called show
#  def show
#  end

  def new
    @possible_energies = Energy::all_energies.collect{|e| [e.id, e.id]}
    @possible_states = FieldState::all_states.collect{|state| [state.id, state.id]}
  end

  def edit
    @possible_energies = Energy::all_energies.collect{|e| [e.id, e.id]}
    @possible_states = FieldState::all_states.collect{|state| [state.id, state.id]}
  end

  def create

    respond_to do |format|
      if @family.save
        format.html { redirect_to(@family, :notice => 'Family was successfully created.') }
        format.xml  { render :xml => @family, :status => :created, :location => @family }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @family.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @family.update_attributes(params[:family])
        format.html { redirect_to(@family, :notice => 'Family was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @family.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to(families_url) }
      format.xml  { head :ok }
    end
  end
end
