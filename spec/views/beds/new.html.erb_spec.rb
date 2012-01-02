require 'spec_helper'

describe "beds/new.html.erb" do
  before(:each) do
    assign(:bed, stub_model(Bed).as_new_record)
    assign(:garden, stub_model(Garden))
    assign(:possible_states, ["A", "B"])
  end

  it "renders new bed form" do
    render
    assert_select "form", :action => garden_beds_path(:garden), :method => "post" do
    end
  end
end
