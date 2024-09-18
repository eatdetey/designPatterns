class Student
	def initialize (surname, name, patronymic, id = nil, phone_num = nil, telegram = nil, email = nil, git = nil)
		@surname = surname
		@name = name
		@patronymic = patronymic
		@id = id
		@phone_num = phone_num
		@telegram = telegram
		@email = email
		@git = git
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
	
	##Getter&Setter for name
	
	attr_accessor :name
	
	##Getter&Setter for surname
	
	attr_accessor :surname
	
	##Getter&Setter for patronymic
	
	attr_accessor :patronymic
	
	##Getter&Setter for ID
	
	attr_accessor :id

	##Getter&Setter for phone number
	
	attr_accessor :phone_num
	
	##Getter&Setter for telegram
	
	attr_accessor :telegram
	
	##Getter&Setter for email
	
	attr_accessor :email

	##Getter&Setter for github
	
	attr_accessor :git
	
end