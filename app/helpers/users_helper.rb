module UsersHelper
	def gravatar_for(user, options = { :size => 50 })
	  gravatar_image_tag(user.email.downcase, :alt => user.name,
								              :class => 'gravatar',
								              :gravatar => options)
	end
	# def title
	# base_title = "Honey-Do-List"
	# if @title.nil?
	#   base_title
	# else
	#   "#{base_title} |  #{@title}"
	# end
 #  end
 #  def logo
 #  	image_tag("logo.png", :alt => "Honey-Do-List", :class => "round")
 #  end
end
