require 'spec_helper'
 

describe List do

  before(:each) do
  	@user = Factory(:user)
  	@attr = { :list_name => "foo bar", :list_item1 => "foo bar1",
  	          :list_item2 => "foo bar2", :list_item3 => "foo bar3" }
  end

  it "should create a new instance with valid attributes" do
  	@user.lists.create!(@attr)
  end

  describe "user associations" do

  	before(:each) do
  	  @list = @user.lists.create(@attr)
  	end

  	it "should have a user attribute" do
  	  @list.should respond_to(:user)	
  	end

  	it "should have the right associated user" do
  	  @list.user_id.should == @user.id 
  	  @list.user.should == @user
  	end
  end

  describe "validations" do
    
    it "should have a user id" do
      List.new(@attr).should_not be_valid
    end

    it "should reject nonblank content" do
      @user.lists.build(:list_name => "     ").should_not be_valid
    end
  end
end


