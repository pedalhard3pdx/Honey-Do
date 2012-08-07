class ListsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

  def index
  end

  def create
  	@list = current_user.lists.build(params[:list])
  	if @list.save
  	  redirect_to root_path, :flash => { :success => "List created!" }
  	else
  	  render 'pages/home'
  	end
  end

  def destroy
  end	

end