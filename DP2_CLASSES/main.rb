require './classStudent.rb'

begin
student_ivan = Student.new("Ivanov", "Ivan-Ivan", "Ivanovich", id:1, phone_num:"+79509995552", telegram:"@ivanich", email:"ivanich@mail.ru", git:"https://github.com/ivanich")
rescue ArgumentError => e
	puts "#{e.message}"
end

student_ivan&.show_info #& - save navigation operator (if object is nil method will not be complited)
puts "\n#{student_ivan.validate}"

# student_petr = Student.new("Petrov", "Petr", "Petrovich", phone_num:"aaaavtomobil", telegram:"@petrucho")
# student_petr.show_info

# student_alex = Student.new("Aleksandrov", "Aleksandr", "Aleksandrovich", phone_num:"9605553535", id:2, email:"alex2014@yandex.ru", git:"github.com/lionalex")
# student_alex.show_info



