class GardensController < ApplicationController
  before_filter :login_required
  load_and_authorize_resource

  def index
    @gardens = current_account.gardens
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(params[:garden])
    @garden.account_id = current_account.id
    if @garden.save
      redirect_to @garden, :notice => "Successfully created garden."
    else
      render :action => 'new'
    end
  end

  def edit
    @garden = Garden.find(params[:id])
  end

  def update
    @garden = Garden.find(params[:id])
    if @garden.update_attributes(params[:garden])
      redirect_to @garden, :notice  => "Successfully updated garden."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @garden = Garden.find(params[:id])
    @garden.destroy
    redirect_to gardens_url, :notice => "Successfully destroyed garden."
  end
end
