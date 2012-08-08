class PagesController < ApplicationController
  def home
  	@title = "Home"
    @list = current_user.lists.build if signed_in?
  end

  def contact
  	@title = "Contact"
  end

  def about
  	@title = "About"
  end
  
  def help
    @title = "Help"
  end

  def new
    @title = "Sign up"
  end
  
end
