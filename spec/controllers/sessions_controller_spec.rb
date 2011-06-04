require File.dirname(__FILE__) + '/../spec_helper'

describe SessionsController do
  fixtures :all
  render_views

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when authentication is invalid" do
    Account.stubs(:authenticate).returns(nil)
    post :create
    response.should render_template(:new)
    session['account_id'].should be_nil
  end

  it "create action should redirect when authentication is valid" do
    Account.stubs(:authenticate).returns(Account.first)
    post :create
    response.should redirect_to(root_url)
    session['account_id'].should == Account.first.id
  end
end
