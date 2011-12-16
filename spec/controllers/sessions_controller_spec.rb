require File.dirname(__FILE__) + '/../spec_helper'

describe SessionsController do

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when authentication is invalid" do
    Account.stub(:authenticate) {nil}
    post :create
    response.should render_template(:new)
    session['account_id'].should be_nil
  end

  it "create action should redirect when authentication is valid" do
    Account.stub(:authenticate){FactoryGirl.create(:account)}
    post :create
    response.should redirect_to(root_url)
    session['account_id'].should == Account.first.id
  end
end
