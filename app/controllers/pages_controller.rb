class PagesController < ApplicationController
  def home
  	@title = "Home"
    @list = List.new if signed_in?
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
