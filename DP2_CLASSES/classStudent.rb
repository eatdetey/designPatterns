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
	
	##Getter&Setter for everything
	
	attr_reader :name, :surname, :patronymic, :id, :phone_num, :telegram, :email, :git
	attr_writer :name, :surname, :patronymic, :id, :phone_num, :telegram, :email, :git
	
end