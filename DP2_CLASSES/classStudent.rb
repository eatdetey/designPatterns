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
	
	def name
		@name
	end
	
	def name=(name)
		@name = name
	end
	
	##Getter&Setter for surname
	
	def surname 
		@surname
	end
	
	def surname=(surname)
		@surname = surname
	end
	
	##Getter&Setter for patronymic
	
	def patronymic
		@patronymic
	end
	
	def patronymic=(patronymic)
		@patronymic = patronymic
	end
	
	##Getter&Setter for ID
	
	def id
		@id
	end
	
	def id=(id)
		@id = id
	end

	##Getter&Setter for phone number
	
	def phone_num 
		@phone_num
	end
	
	def phone_num=(phone_num)
		@phone_num = phone_num
	end
	
	##Getter&Setter for telegram
	
	def telegram
		@telegram
	end
	
	def telegram=(telegram)
		@telegram = telegram
	end
	
	##Getter&Setter for email
	
	def email
		@email
	end
	
	def email=(email)
		@email = email
	end
	
	##Getter&Setter for github
	
	def git
		@git
	end
	
	def git=(git)
		@git = git
	end
	
end
