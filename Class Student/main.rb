require_relative 'Student'
require_relative 'StudentShort'
require_relative 'BinaryTree.rb'

begin
	student_ivan = Student.new(surname:"Ivanov", name:"Ivan-Ivan", patronymic:"Ivanovich", id: 1, phone_num:"+79509995552", telegram:"@ivanich", email:"ivanich@mail.ru", git:"https://github.com/ivanich", date_of_birth:"12.11.2004")
	student_ivan2 = Student.new(surname:"Ivanov", name:"Ivan", patronymic:"Ivanovich", id: 1, phone_num:"+79509995552", telegram:"@ivanich", email:"ivanich@mail.ru", git:"https://github.com/ivanich", date_of_birth:"12.11.2102")
student_short_ivan = StudentShort.from_student(student_ivan)
rescue ArgumentError => e
	puts "#{e.message}"
end

puts student_ivan.date_of_birth
puts student_ivan2.date_of_birth

puts student_ivan.date_of_birth > student_ivan2.date_of_birth

tree = BinaryTree.new
tree.add(student_ivan)
tree.add(student_ivan2)

tree.iterator.each do |node|
	puts node.name
end



