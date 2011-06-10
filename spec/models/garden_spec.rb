require File.dirname(__FILE__) + '/../spec_helper'

describe Garden do
  it "should be valid" do
    Garden.new.should be_valid
  end
end
