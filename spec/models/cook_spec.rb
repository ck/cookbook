require File.join( File.dirname(__FILE__), '..', "spec_helper" )

module CookSpecHelper
  def cook_attributes(options = {})
    {
      :login => 'joe',
      :email => 'joe@example.com',
      :password => 'secret',
      :password_confirmation => 'secret'
    }.merge(options)
  end
end

describe Cook do

  include CookSpecHelper

  before(:each) do
    @cook = Cook.new
  end

  it "should be invalid without a login" do
    @cook.attributes = cook_attributes.except(:login)
    @cook.should_not be_valid
    @cook.errors.on(:login).should include("Login must not be blank")
  end

  it "should be invalid without an email" do
    @cook.attributes = cook_attributes.except(:email)
    @cook.should_not be_valid
    @cook.errors.on(:email).should include("Email must not be blank")
  end

  it "should be invalid without a proper email" do
    [ "joe", "joe@", "joe example", "@example", "joe@example com" ].each do |email|
      @cook.attributes = cook_attributes(:email => email)
      @cook.should_not be_valid
      @cook.errors.on(:email).should include("Email has an invalid format")
    end
  end

  it "should be valid with a full set of valid attributes" do
    @cook.attributes = cook_attributes
    @cook.should be_valid
  end

end
