require 'spec_helper'

describe ListsController do
  render_views


  describe "access control" do

  	it "should deny access to 'create'" do
  	  post :create
  	  response.should redirect_to(signin_path)
  	end

  	it "should deny access to 'destroy'" do
  	  delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

    describe "failure" do

      before(:each) do
        @attr = { :list_name => "" }
      end

      it "should not create a list" do
        lambda do
          post :create, :list => @attr
        end.should_not change(List, :count)
      end

      it "should render the home page" do
        post :create, :list => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :list_name => "Lorem ipsum" }
      end

      it "should create a list" do
        lambda do
          post :create, :list => @attr
        end.should change(List, :count).by(1)
      end

      it "should redirect to the profile page" do
        post :create, :list => @attr
        response.should redirect_to(user_path(1))
      end

      it "should have a flash message" do
        post :create, :list => @attr
        flash[:success].should =~ /list created/i
      end
    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_sign_in(wrong_user)
        @list = Factory(:list, :user => @user)
      end

      it "should deny access" do
        delete :destroy, :id => @list
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        @list = Factory(:list, :user => @user)
      end

      it "should destroy the micropost" do
        lambda do 
          delete :destroy, :id => @list
        end.should change(List, :count).by(-1)
      end
    end
  end
end
