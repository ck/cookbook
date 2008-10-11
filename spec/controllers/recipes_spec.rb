require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Recipes, "index action" do
  before(:each) do
    dispatch_to(Recipes, :index)
  end
end