require 'spec_helper'

describe "Tasks" do
  describe "GET /tasks" do
    it "tasks_path returns ok" do
      get garden_tasks_path
      response.status.should be(200)
      response.body.should contain "tasks"
    end
  end
end
