require './classStudent.rb'

student_ivan = Student.new("Ivanov", "Ivan", "Ivanovich", 1, "+79609998877", "@ivanich", "ivanich@mail.ru", "github.com/ivanich")
student_petr = Student.new("Petrov", "Petr", "Petrovich", nil, nil, "@petrucho")
student_alex = Student.new("Aleksandrov", "Aleksandr", "Aleksandrovich", 2, nil, nil, "alex2014@yandex.ru", "github.com/lionalex")

student_ivan.show_info
student_petr.show_info
student_alex.show_info