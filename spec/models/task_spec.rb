require File.dirname(__FILE__) + '/../spec_helper'

describe Task do

  before(:each) do
    puts Task.all.size.to_s
    Plant.all.each do |p|
      puts p.name
    end
  end
  it "should be valid" do
    Task.new.should be_valid
  end
end

