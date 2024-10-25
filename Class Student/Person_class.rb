class Person
	attr_reader :id, :git
	
	def initialize(id: nil, git: nil)
		@id = id
		@git = git
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
	
	def initials
		if @initials
			@initials
		else
			"#{surname} #{name[0]}. #{patronymic[0]}."
		end
	end

	def contact
		if @contact
			@contact
		else
			if !@phone_num.nil?
				{'phone number':@phone_num}
			elsif !@telegram.nil?
				{'telegram': @telegram}
			elsif !@email.nil?
				{'email': @email}
			end
		end
	end
end