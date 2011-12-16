require File.dirname(__FILE__) + '/../spec_helper'

describe AccountsController do
#  fixtures :all
  #render_views

  it "can offer a new account" do
    get :new
    response.should be_success
    response.should render_template(:new)

  end

  it "create action should render new template when model is invalid" do
    account = FactoryGirl.attributes_for(:account)
    Account.any_instance.stubs(:valid?).returns(false)
    post :create, account
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    account = FactoryGirl.attributes_for(:account)

    post :create, account: account
    response.should redirect_to(root_url)
    session['account_id'].should == assigns['account'].id
  end

  it "edit action should redirect when not logged in" do
    get :edit, :id => "ignored"
    response.should redirect_to(login_url)
  end

  it "edit action should render edit template" do
    @controller.stubs(:current_account).returns(FactoryGirl.create(:account))
    get :edit, :id => "ignored"
    response.should render_template(:edit)
  end

  it "update action should redirect when not logged in" do
    put :update, :id => "ignored"
    response.should redirect_to(login_url)
  end

  it "update action should render edit template when account is invalid" do
    @controller.stub(:current_account).and_return(FactoryGirl.create(:account))
    Account.any_instance.stub(:valid?).and_return(false)
    put :update, :id => "ignored"
    response.should render_template(:edit)
  end

  it "update action should redirect when account is valid" do
    @controller.stub(:current_account) {FactoryGirl.create(:account)}
    Account.any_instance.stub(:valid?) {true}
    put :update, :id => "ignored"
    response.should redirect_to(root_url)
  end
end
