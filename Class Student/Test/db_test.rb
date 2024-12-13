require 'pg'
require_relative '../Models/Student/Student.rb'
require_relative '../Models/StudentsList/StudentsListDB'

host = 'localhost'
port = 5434
dbname = 'students'
user = 'postgres'
password = 'admin'

db_params = {host: host, port: port, dbname: dbname, user: user, password: password}

students_list_db = StudentsListDB.new(db_params)

test_student = Student.new(surname:"Серый", name:"Максим", patronymic:"Андреевич", phone_num: "89182297016", date_of_birth: '1990-02-02')
# students_list_db.add_student(test_student)

data_list = students_list_db.get_k_n_student_short_list(1, 50)
data = data_list.get_data
(0..data.row_count - 1).each do |index|
    puts "#{data.get_element(index, 0)}, #{data.get_element(index, 1)}, #{data.get_element(index, 2)}, #{data.get_element(index, 3)}"   
end

puts "Количество записей в таблице: #{students_list_db.get_student_short_count}"