class User
	attr_accessor :name, :email

	def initialized(attributes = {})
		@name  = attributes[:name]
		@email = attributes[:email]
 
    def formatted_email
	"#{@name} <#{@email}>"
    end
end

