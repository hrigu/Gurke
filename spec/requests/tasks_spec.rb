require 'spec_helper'

describe "Tasks" do
  describe "GET garden/tasks" do
    it "garden_tasks_path returns ok" do
      @account = FactoryGirl.create(:account)
      @garden = FactoryGirl.create(:garden)
      TasksController.any_instance.stub(:logged_in?){true}
      TasksController.any_instance.stub(:current_account){@account}
      get garden_tasks_path(:garden_id => @garden.id)
      response.status.should be(200)
      response.body.should include "tasks"
    end
  end
end
