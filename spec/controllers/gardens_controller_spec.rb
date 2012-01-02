require 'spec_helper'

def valid_attributes
  {name: "name", place: "place"
  }
end

describe GardensController do

  context "not logged in" do
    describe "GET index" do
      it "redirects to " do
        get :index
        response.should redirect_to login_path
      end
    end

  end

  context "logged in" do

    before :each do
      @account = double "account"
      @account.stub(:id){1}
      @controller.stub(:current_account) {@account }

    end

    describe "GET index" do
      it "success" do
        @account.stub(:gardens) { "gardens" }
        get :index
        response.should be_success
        assigns(:gardens).should == "gardens"
      end
    end

    describe "GET show" do
      it "success" do
        @controller.stub(:load_and_authorize_resource) { @garden = double "garden"}
        garden = Garden.create! valid_attributes
        get :show, :id => garden.id.to_s
        response.should be_success
        assigns(:garden).should == garden
      end
    end
  end

  #describe "post move" do
  #  it "have success" do
  #    post :move_bed, :id => "1"
  #    response.should be_success
  #  end
  #end
end
