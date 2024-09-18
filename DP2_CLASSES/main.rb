require './classStudent.rb'

student_ivan = Student.new("Ivanov", "Ivan", "Ivanovich", id:1, phone_num:"+79609998877", telegram:"@ivanich", email:"ivanich@mail.ru", git:"github.com/ivanich")
student_petr = Student.new("Petrov", "Petr", "Petrovich", telegram:"@petrucho")
student_alex = Student.new("Aleksandrov", "Aleksandr", "Aleksandrovich", id:2, email:"alex2014@yandex.ru", git:"github.com/lionalex")

student_ivan.show_info
student_petr.show_info
student_alex.show_info