require './Person_class.rb'

class Student < Person
	
	##Object initialization
	
	def initialize (surname:, name:, patronymic:, id:nil, phone_num:nil, telegram:nil, email:nil, git:nil)
		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		super(id: id, git: git)
		set_contacts(phone_num:phone_num, telegram:telegram, email:email)
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
		"#{initials}, #{git}, #{contact}"
	end
	
end
