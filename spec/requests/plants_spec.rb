require 'spec_helper'

describe "Plants" do
  describe "GET /plants" do
    it "plants_path returns ok" do
      get plants_path
      response.status.should be(200)
      response.body.should include "Pflanzen"
    end
  end
end
