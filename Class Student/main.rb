require_relative 'Student_class'
require_relative 'StudentShort_class'

begin
student_ivan = Student.new(surname:"Ivanov", name:"Ivan-Ivan", patronymic:"Ivanovich", id: 1, phone_num:"+79509995552", telegram:"@ivanich", email:"ivanich@mail.ru", git:"https://github.com/ivanich")
student_short_ivan = StudentShort.from_student(student_ivan)
rescue ArgumentError => e
	puts "#{e.message}"
end

puts student_ivan
puts student_short_ivan



