require_relative '../Person/Person'

class StudentShort < Person

  def initialize(initials:, id: nil, git: nil, contact: nil)
    super(id: id, git: git)
    @initials = initials
    @contact = contact
  end

  def self.from_student(student)
    new(id: student.id, initials: student.initials, git: student.git, contact: student.contact)
  end
  
  def self.from_string(id: ,string:)
    initials, git, contact = parse_info_string(string)
    new(id: id, initials: initials, git: git, contact: contact)
  end
  
  private
  
  def self.parse_info_string(string)
    initials, git, contact = string.split(', ')
    return initials, git, contact
  end
  
  private_class_method :new
  
  def to_s
    "\n#{initials}:" +\
    (id ? ("\nID - #{@id}") : "") +\
    (contact ? ("\nContact information - #{@contact}") : "") +\
    (git ? ("\nGitHub - #{@git}\n") : "")
  end
end
