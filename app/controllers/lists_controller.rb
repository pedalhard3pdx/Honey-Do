class ListsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy



  def create
  	@list = current_user.lists.build(params[:list])
  	if @list.save
      flash[:success] = "List created!"
  	  redirect_to current_user
  	else
      flash[:error] = "Try again please!"
  	  render 'pages/home'
  	end
  end

  def destroy
    @list.destroy
    flash[:success] = "List deleted!"
    redirect_back_or root_path
  end

  private

    def authorized_user
      @list = current_user.lists.find_by_id(params[:id])
      redirect_to root_path if @list.nil?
    end

end