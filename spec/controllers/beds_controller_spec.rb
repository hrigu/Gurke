require 'spec_helper'


describe BedsController do
  before :each do

    @account = FactoryGirl.create(:account)

    @controller.stub(:current_account) { @account }
    # Eigentlich sollte dieser stub nicht nötig sein, da current_account ein alias von current_user ist. Aber anscheinend wird jene Methode
    # in diesem Fall nicht gestubbed.. Darum noch dieser stub
    @controller.stub(:current_user) { @account }

    @garden = FactoryGirl.create(:garden, account_id: @account.id)
    @bed = FactoryGirl.create(:bed, garden_id: @garden.id)

  end

  describe "GET show" do
    it "assigns the requested bed as @bed" do
      get :show, garden_id: @garden.id, id: @bed.id
      assigns(:bed).should eq(@bed)
    end
  end


  describe "PUT move_beds" do
    it "success" do
      post :move_bed, garden_id: @garden.id.to_s, id: @bed.id.to_s, position: {right: 10, left: 33}
      assigns(:bed).should eq(@bed)
    end
  end

  describe "GET add_plants" do
    it "success" do
      @bed.garden.account.id.should == @account.id
      get :add_plants, garden_id: @garden.id, id: @bed.id.to_s
      response.should be_success
      response.should render_template "add_plants"
    end
  end


  describe "DELETE destroy" do
    it "redirects to the beds list" do
      delete :destroy, garden_id: @garden.id, :id => @bed.id
      response.should redirect_to(garden_url(@garden))
    end
  end

end
