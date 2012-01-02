require 'spec_helper'

describe "beds/show.html.erb" do
  before(:each) do
    @bed = assign(:bed, stub_model(Bed))
    @bed = assign(:garden, stub_model(Garden))
  end

  it "renders attributes in <p>" do
    render
  end
end
