class Student
	def initialize (surname, name, patronymic, **contacts)
		@surname = surname
		@name = name
		@patronymic = patronymic
		@id = contacts[:id]
		@phone_num = contacts[:phone_num]
		@telegram = contacts[:telegram]
		@email = contacts[:email]
		@git = contacts[:git]
	end
	
	## Method to show info about object
	
	def show_info
		puts "\n#{@surname} #{@name} #{@patronymic}:"
		id ? (puts "ID - #{@id}") : nil
		phone_num ? (puts "Phone number - #{@phone_num}") : nil
		telegram ? (puts "Telegram - #{@telegram}") : nil
		email ? (puts "Email - #{@email}") : nil
		git ? (puts "Github - #{@git}\n") : nil
	end
	
	##Getter&Setter for everything
	
	attr_accessor :name, :surname, :patronymic, :id, :phone_num, :telegram, :email, :git
end