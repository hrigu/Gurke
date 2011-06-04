require File.dirname(__FILE__) + '/../spec_helper'

describe Account do
  def new_account(attributes = {})
    attributes[:username] ||= 'foo'
    attributes[:email] ||= 'foo@example.com'
    attributes[:password] ||= 'abc123'
    attributes[:password_confirmation] ||= attributes[:password]
    Account.new(attributes)
  end

  before(:each) do
    Account.delete_all
  end

  it "should be valid" do
    new_account.should be_valid
  end

  it "should require username" do
    new_account(:username => '').should have(1).error_on(:username)
  end

  it "should require password" do
    new_account(:password => '').should have(1).error_on(:password)
  end

  it "should require well formed email" do
    new_account(:email => 'foo@bar@example.com').should have(1).error_on(:email)
  end

  it "should validate uniqueness of email" do
    new_account(:email => 'bar@example.com').save!
    new_account(:email => 'bar@example.com').should have(1).error_on(:email)
  end

  it "should validate uniqueness of username" do
    new_account(:username => 'uniquename').save!
    new_account(:username => 'uniquename').should have(1).error_on(:username)
  end

  it "should not allow odd characters in username" do
    new_account(:username => 'odd ^&(@)').should have(1).error_on(:username)
  end

  it "should validate password is longer than 3 characters" do
    new_account(:password => 'bad').should have(1).error_on(:password)
  end

  it "should require matching password confirmation" do
    new_account(:password_confirmation => 'nonmatching').should have(1).error_on(:password)
  end

  it "should generate password hash and salt on create" do
    account = new_account
    account.save!
    account.password_hash.should_not be_nil
    account.password_salt.should_not be_nil
  end

  it "should authenticate by username" do
    account = new_account(:username => 'foobar', :password => 'secret')
    account.save!
    Account.authenticate('foobar', 'secret').should == account
  end

  it "should authenticate by email" do
    account = new_account(:email => 'foo@bar.com', :password => 'secret')
    account.save!
    Account.authenticate('foo@bar.com', 'secret').should == account
  end

  it "should not authenticate bad username" do
    Account.authenticate('nonexisting', 'secret').should be_nil
  end

  it "should not authenticate bad password" do
    new_account(:username => 'foobar', :password => 'secret').save!
    Account.authenticate('foobar', 'badpassword').should be_nil
  end
end
