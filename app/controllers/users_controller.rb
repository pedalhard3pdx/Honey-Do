  class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

  def show
  	@user = User.find(params[:id])
  	@title = @user.name
  end

  def new
  	@user  = User.new
  	@title = "Sign up"
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
      redirect_to @user, :flash => { :success => "Welcome to the Honey-Do List!"}
    else
	  @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @user  = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    @user  = User.find(params[:id])
    if @user.update_attributes(params[:user])
      # It worked
      redirect_to @user, :flash => { :success => "Profile updated." }
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
      end
      

       
  
end
 
