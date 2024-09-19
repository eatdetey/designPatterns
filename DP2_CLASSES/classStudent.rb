class Student
	def initialize (surname, name, patronymic, **contacts)
		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		self.id = contacts[:id]
		self.phone_num = contacts[:phone_num]
		self.telegram = contacts[:telegram]
		self.email = contacts[:email]
		self.git = contacts[:git]
	end
	
	## Name validator
	
	def self.is_valid_name?(name)
		!!(name =~ /^[А-ЯA-Z][а-яa-zA-ZА-Я\-]{1,20}$/)
	end
	
	## ID validator
	
	def self.is_valid_id?(id)
		!!(id == nil || id.to_s =~ /^(\d+)$/)
	end
	
	## Phone number validator
	
	def self.is_valid_phone_num?(phone_num)
		!!(phone_num == nil || phone_num =~ /^(?:\+7|8)\d{10}$/)
	end
	
	## Telegram validator
	
	def self.is_valid_telegram?(telegram)
		!!(telegram == nil || telegram =~ /^@[\w]{3,20}$/)
	end
	
	## Email validator
	
	def self.is_valid_email?(email)
		!!(email == nil || email =~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
	end
	
	## GitHub validator
	
	def self.is_valid_git?(git)
		!!(git == nil || git =~ /^https?:\/\/(www\.)?github\.com\/[A-Za-z0-9_-]+(\/[A-Za-z0-9._-]+)?(\/.*)?$/)
	end

	##Getter for everything
	
	attr_reader :name, :surname, :patronymic, :id, :phone_num, :telegram, :email, :git
	
	## Name setter
	
	def name=(name)
		if self.class.is_valid_name?(name)
			@name = name
		else
			raise ArgumentError, "\n Name (#{name}) has the wrong format! Object was not created."
		end
	end
	
	## Surname setter
	
	def surname=(surname)
		if self.class.is_valid_name?(surname)
			@surname = surname
		else
			raise ArgumentError, "\n Surname (#{surname}) has the wrong format! Object was not created."
		end
	end
	
	## Patronymic setter
	
	def patronymic=(patronymic)
		if self.class.is_valid_name?(patronymic)
			@patronymic = patronymic
		else
			raise ArgumentError, "\n Patronymic (#{patronymic}) has the wrong format! Object was not created."
		end
	end
	
	## Phone number setter
	
	def phone_num=(phone_num)
		if self.class.is_valid_phone_num?(phone_num)
			@phone_num = phone_num
		else
		puts "\nPhone number (#{phone_num}) is in the wrong format and was not recorded!"
		end
	end
	
	## ID setter
	
	def id=(id)
		if self.class.is_valid_id?(id)
			@id = id
		else
		puts "\nID (#{id}) is in the wrong format and was not recorded!"
		end
	end
	
	## Telegram setter
	
	def telegram=(telegram)
		if self.class.is_valid_telegram?(telegram)
			@telegram = telegram
		else
		puts "\nTelegram  (#{telegram}) is in the wrong format and was not recorded!"
		end
	end
	
	## Email setter
	
	def email=(email)
		if self.class.is_valid_email?(email)
			@email = email
		else
		puts "\nEmail (#{email}) is in the wrong format and was not recorded!"
		end
	end
	
	## GitHub setter
	
	def git=(git)
		if self.class.is_valid_git?(git)
			@git = git
		else
		puts "\nGithub (#{git}) link is in the wrong format and was not recorded!"
		end
	end
	
	## Check git existence
	
	def is_git?
		!@git.nil?	
	end
	
	## Check contacts existence
	
	def is_contacts?
		!@phone_num.nil? || !@telegram.nil? || !@email.nil?
	end
	
	## Check GitHub and contacts existence
	
	def validate
		is_git? && is_contacts?
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
end