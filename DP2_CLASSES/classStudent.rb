class Student
	def initialize (surname, name, patronymic, **contacts)
		@surname = surname
		@name = name
		@patronymic = patronymic
		@id = contacts[:id]
		self.phone_num = contacts[:phone_num] ##Change instance variable(@) to self so setter with validation can work
		@telegram = contacts[:telegram]
		@email = contacts[:email]
		@git = contacts[:git]
	end
	
	##Getter&Setter for everything EXEPT phone number
	
	attr_accessor :name, :surname, :patronymic, :id, :telegram, :email, :git
	
	## Phone number getter
	
	attr_reader :phone_num
	
	## Method to show info about object
	
	def show_info
		puts "\n#{@surname} #{@name} #{@patronymic}:"
		id ? (puts "ID - #{@id}") : nil
		phone_num ? (puts "Phone number - #{@phone_num}") : nil
		telegram ? (puts "Telegram - #{@telegram}") : nil
		email ? (puts "Email - #{@email}") : nil
		git ? (puts "Github - #{@git}\n") : nil
	end
	
	## Phone number validator
	
	def self.is_valid_phone_num?(phone_num)
		!!(phone_num == nil || phone_num =~ /^(?:\+7|8)\d{10}$/)
	end
	
	## Phone number setter
	
	def phone_num=(phone_num)
		if self.class.is_valid_phone_num?(phone_num)
			@phone_num = phone_num
		else
		puts "\nSome of the phone numbers are in the wrong format and were not recorded!"
		end
	end
end