require 'spec_helper'

describe "Families" do
  describe "GET /families" do
    it "families_path" do
      get families_path
      response.status.should be(200)
    end
  end
end
