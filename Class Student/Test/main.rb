require_relative "../Models/Student/Student.rb"
require_relative "../Models/StudentShort/StudentShort.rb"
require_relative "../Models/BinaryTree/BinaryTree.rb"
require_relative "../Models/StudentsList/StudentsListJSON.rb"

require_relative "../Models/DataList/DataListStudentShort.rb"

alex = Student.new(surname:"Смирнов", name:"Алексей", patronymic:"Петрович", id: 1, phone_num: "89991234567", git: "https://github.com/alex", date_of_birth: "12.07.2003")
kate = Student.new(surname:"Петрова", name:"Екатерина", patronymic:"Игоревна", id: 2, phone_num: "89265554433", telegram: "@Katya123", git: "katya_repo", date_of_birth: "22.11.2004")
dmitry = Student.new(surname:"Зайцев", name:"Дмитрий", patronymic:"Андреевич", id: 3, phone_num: "89881234567", telegram: "@DimaN", date_of_birth: "03.04.2005")
anna = Student.new(surname:"Крылова", name:"Анна", patronymic:"Викторовна", phone_num: "89033445566")

anya = StudentShort.from_student(anna)
vlad = StudentShort.from_string(id: 10, string: "Белоусов В.А., https://github.com/vlad_bel, +79876543210")
nikolay = StudentShort.from_string(id: 20, string: "Зеленый Н.Н.")

puts("\nDataListStudentShort:")
student_short_list = DataListStudentShort.new([anya, vlad, nikolay])
table = student_short_list.get_data

(0..table.row_count - 1).each do |index|
    puts "#{index}: #{table.get_element(index, 1)}, #{table.get_element(index, 2)}, #{table.get_element(index, 3)}"   
end

students_list = StudentsListJSON.new('../Data/students.json')
students_list.read
students_list.sort_by_initials

puts "Отсортированные студенты в students_list (первые 2):"
data_list = students_list.get_k_n_student_short_list(1, 2)
data = data_list.get_data

(0..data.row_count - 1).each do |index|
    puts "#{data.get_element(index, 0)}, #{data.get_element(index, 1)}, #{data.get_element(index, 2)}, #{data.get_element(index, 3)}"   
end

# test_student = Student.new(surname:"Серый", name:"Максим", patronymic:"Андреевич", phone_num: "89182297016")

# puts "Добавление нового студента:"
# students_list.add_student(test_student)
# students_list.sort_by_initials

# data_list = students_list.get_k_n_student_short_list(1, students_list.get_student_short_count)
# data = data_list.get_data


# (0..data.row_count - 1).each do |index|
#     puts "#{data.get_element(index, 0)}, #{data.get_element(index, 1)}, #{data.get_element(index, 2)}, #{data.get_element(index, 3)}"   
# end

# puts "\nУдаление студента по id 4:"
# students_list.delete_student_by_id(1)
# data_list = students_list.get_k_n_student_short_list(1, students_list.get_student_short_count)
# data = data_list.get_data

# (0..data.row_count - 1).each do |index|
#     puts "#{data.get_element(index, 0)}, #{data.get_element(index, 1)}, #{data.get_element(index, 2)}, #{data.get_element(index, 3)}"   
# end

# puts "\nЗамена студента с id 3:"
# students_list.replace_student_by_id(3, test_student)
# data_list = students_list.get_k_n_student_short_list(1, students_list.get_student_short_count)
# data = data_list.get_data

# (0..data.row_count - 1).each do |index|
#     puts "#{data.get_element(index, 0)}, #{data.get_element(index, 1)}, #{data.get_element(index, 2)}, #{data.get_element(index, 3)}"  
# end