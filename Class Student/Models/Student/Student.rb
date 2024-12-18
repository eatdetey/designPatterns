require_relative '../Person/Person.rb'
require_relative '../BinaryTree/BinaryTree.rb'

class Student < Person
	
	include Comparable
	
	##Object initialization
	
	def initialize (surname:, name:, patronymic:, id:nil, phone_num:nil, telegram:nil, email:nil, git:nil, date_of_birth:nil)
		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		self.date_of_birth = date_of_birth
		super(id: id, git: git)
		set_contacts(phone_num:phone_num, telegram:telegram, email:email)
	end
	
	##Getter for everything
	
	attr_reader :name, :surname, :patronymic, :phone_num, :telegram, :email, :date_of_birth
	
	def <=>(other)
		if other.is_a?(Student)
		  self.date_of_birth <=> other.date_of_birth
		else
		  raise ArgumentError, "Can't compare #{self.class} with #{other.class}"
		end
	end

	def ==(other)
        if email.nil? || self.email == other.email
            return false
        end
        if telegram.nil? || self.telegram == other.email
            return false
        end
        if phone.nil? || self.phone == other.phone
            return false
        end
        if github.nil? || self.github == other.github
            return false
        end
        return true
    end

	def date_of_birth=(val)
		if self.class.is_valid_date_of_birth?(val)
			if val.is_a?(String)
				@date_of_birth = Date.parse(val)
			else
				@date_of_birth = val
			end
		else
			raise ArgumentError, "Wrong format"
		end
	end
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
			if val.is_a?(String)
				@id = val.to_i
			else
				@id = val
			end
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
		
	def self.new_from_hash(hash)
		self.new(**hash.transform_keys(&:to_sym))
	end

	## Changing method to_s instead making new method for showing object's info
	
	def to_s
		"\n#{@surname} #{@name} #{@patronymic}:" +\
		(id ? ("\nID - #{@id}") : "")  +\
		(phone_num ? ("\nPhone number - #{@phone_num}") : "") +\
		(telegram ? ("\nTelegram - #{@telegram}") : "") +\
		(email ? ("\nEmail - #{@email}") : "")  +\
		(git ? ("\nGithub - #{@git}") : "") +\
		(date_of_birth ? ("\nDate of birth - #{@date_of_birth}\n") : "")
	end
	
	def to_h
		{id: self.id, surname: self.surname, name: 
		self.name, patronymic: self.patronymic, date_of_birth: 
		self.date_of_birth, telegram: self.telegram, email: self.email, 
		phone_num: self.phone_num, git: self.git}
	end
	
	def get_info
		"#{initials}, #{git}, #{contact}"
	end
	
end
