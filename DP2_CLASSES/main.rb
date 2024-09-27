require './student_class.rb'

begin
student_ivan = Student.new(surname:"Ivanov", name:"Ivan-Ivan", patronymic:"Ivanovich", phone_num:"+79509995552", telegram:"@ivanich", email:"ivanich@mail.ru", git:"https://github.com/ivanich")
rescue ArgumentError => e
	puts "#{e.message}"
end

student_ivan_short = StudentShort.new(student:student_ivan)

puts student_ivan_short

student_max = StudentShort.new(id:1, info:"Max M.M. mail@mail.ry")

puts student_max

#puts student_ivan
#puts student_ivan.get_info

# student_petr = Student.new("Petrov", "Petr", "Petrovich", phone_num:"aaaavtomobil", telegram:"@petrucho")
# student_petr.show_info

# student_alex = Student.new("Aleksandrov", "Aleksandr", "Aleksandrovich", phone_num:"9605553535", id:2, email:"alex2014@yandex.ru", git:"github.com/lionalex")
# student_alex.show_info



