require "spec_helper"

describe "BedsController" do
  describe "get /gardens/1/beds" do
    it "works! (now write some real specs)" do
      @account = FactoryGirl.create(:account)
      @garden = FactoryGirl.create(:garden, account_id: @account.id)
      @bed = FactoryGirl.create(:bed, garden_id: @garden.id)
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      BedsController.any_instance.stub(:logged_in?){true}
      BedsController.any_instance.stub(:current_account){@account}
      get(garden_bed_path(:garden_id => @garden.id, :id => @bed.id))
      response.status.should be(200)
    end
  end
end
