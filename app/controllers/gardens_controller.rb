class GardensController < ApplicationController
  before_filter :login_required
  load_and_authorize_resource

  #show, new, edit defined by views

  def index
    #because @gardens is defined here, the load_and_authrize filter doesn't load gardens
    @gardens = current_account.gardens
  end

  def create
    @garden.account_id = current_account.id
    if @garden.save
      redirect_to @garden, :notice => "Successfully created garden."
    else
      render :action => 'new'
    end
  end

  def update
    if @garden.update_attributes(params[:garden])
      redirect_to @garden, :notice  => "Successfully updated garden."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @garden.destroy
    redirect_to gardens_url, :notice => "Successfully destroyed garden."
  end
end
