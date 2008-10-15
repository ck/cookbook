require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "the cook is authenticated" do
  request(url(:perform_login), :method => "PUT", :params => { :login => "joe", :password => "secret" })
end

describe "resource(:recipes)" do

  before(:all) do
    DataMapper.setup(:default, "sqlite3::memory:")
    DataMapper.auto_migrate!

    Cook.new(:login => 'joe', :email => 'joe@example.com', :password => 'secret', :password_confirmation => 'secret').save
  end

  after(:each) do
    Cook.all.destroy!
    Recipe.all.destroy!
  end

  describe "GET" do

    before(:each) do
      @response = request(resource(:recipes))
    end

    it "should return 'HTTP Error 401 - Unauthorized' status" do
      @response.status == 401
    end

  end

  describe "GET (authenticatd)", :given => "the cook is authenticated" do

    before(:each) do
      @response = request(resource(:recipes))
    end

    it "should return successfully" do
      @response.status == 200
    end

  end
end
