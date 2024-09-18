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
	
	attr_reader :name
	attr_writer :name
	
	##Getter&Setter for surname
	
	attr_reader :surname
	attr_writer :surname
	
	##Getter&Setter for patronymic
	
	attr_reader :patronymic
	attr_writer :patronymic
	
	##Getter&Setter for ID
	
	attr_reader :id
	attr_writer :id

	##Getter&Setter for phone number
	
	attr_reader :phone_num
	attr_writer :phone_num
	
	##Getter&Setter for telegram
	
	attr_reader :telegram
	attr_writer :telegram
	
	##Getter&Setter for email
	
	attr_reader :email
	attr_writer :email

	##Getter&Setter for github
	
	attr_reader :git
	attr_writer :git
	
end