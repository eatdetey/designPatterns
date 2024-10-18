class Person
	attr_reader :id, :git
	
	protected
	
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
end
class Student < Person
	
	##Object initialization
	
	def initialize (surname:, name:, patronymic:, id:nil, phone_num:nil, telegram:nil, email:nil, git:nil)
		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		self.id = id
		set_contacts(phone_num:phone_num, telegram:telegram, email:email)
		self.git = git
	end
	
	##Getter for everything
	
	attr_reader :name, :surname, :patronymic, :phone_num, :telegram, :email
	
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
	
	## ID setter
	
	def id=(id)
		if self.class.is_valid_id?(id)
			@id = id
		else
		raise ArgumentError, "\nID (#{id}) is in the wrong format and was not recorded!"
		end
	end
	
	## Git setter
	def git=(git)
		if self.class.is_valid_git?(git)
			@git = git
		else
		raise ArgumentError, "\nGithub link (#{git}) is in the wrong format and was not recorded!"
		end
	end
	
	## Contacts setter
	
	def set_contacts(phone_num:nil, telegram:nil, email:nil)
		(self.class.is_valid_phone_num?(phone_num)) ? @phone_num=phone_num : (raise ArgumentError, "\nPhone number (#{phone_num}) is in the wrong format and was not recorded!")
		(self.class.is_valid_telegram?(telegram)) ? @telegram=telegram : (raise ArgumentError, "\nTelegram  (#{telegram}) is in the wrong format and was not recorded!")
		(self.class.is_valid_email?(email)) ? @email=email : (raise ArgumentError, "\nEmail (#{email}) is in the wrong format and was not recorded!")
	end
	
	## Check git existence
	
	def is_git?
		!@git.nil? ? @git : "No GitHub link"
	end
	
	## Check contacts existence
	
	def is_contacts?
		if !@phone_num.nil?
			@phone_num
		elsif !@telegram.nil?
			@telegram
		elsif !@email.nil?
			@email
		else
			"No contacts"
		end
	end
	
	def get_initials
		"#{surname} #{name[0]}. #{patronymic[0]}."
	end

	
	## Check GitHub and contacts existence
	
	def validate
		is_git? && is_contacts?
	end
		
	## Changing method to_s instead making new method for showing object's info
	
	def to_s
		"\n#{@surname} #{@name} #{@patronymic}:" +\
		(id ? ("\nID - #{@id}") : "")  +\
		(phone_num ? ("\nPhone number - #{@phone_num}") : "") +\
		(telegram ? ("\nTelegram - #{@telegram}") : "") +\
		(email ? ("\nEmail - #{@email}") : "")  +\
		(git ? ("\nGithub - #{@git}\n") : "")
	end
	
	
	def get_info
		"#{get_initials}, #{is_git?}, #{is_contacts?}"
	end
	
end
class StudentShort < Student
	attr_reader :initials, :contact
	
	def initialize (student:nil, id:nil, info:nil)
		if student 
			@id = student.id
			@initials = student.get_initials
			@git = student.git
			@contact = student.is_contacts?
		else
			@id = id
			info_list = info.split(' ')
			@initials = info_list[0] + " " + info_list[1]
			@git = info_list[2]
			@contact = info_list[3]
		end
	end
	
	def to_s
		"\n#{initials}:" +\
		(id ? ("\nID - #{@id}") : "")  +\
		(contact ? ("\nContact information - #{@contact}") : "") +\
		(git ? ("\nGitHub - #{@git}\n") : "")
	end
	
end