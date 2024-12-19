require_relative "../Models/Student/Student.rb"
require_relative "../Models/StudentShort/StudentShort.rb"
require_relative "../Models/StudentsList/StudentsListJSON.rb"
require_relative "../Models/StudentsList/StudentsListYAML.rb"
require_relative "../Models/StudentsList/StudentsList.rb"

require_relative "../Models/DataList/DataListStudentShort.rb"

alex = Student.new(surname:"Смирнов", name:"Алексей", patronymic:"Петрович", id: 1, phone_num: "89991234567", git: "https://github.com/alex", date_of_birth: "12.07.2003")
kate = Student.new(surname:"Петрова", name:"Екатерина", patronymic:"Игоревна", id: 2, phone_num: "89265554433", telegram: "@Katya123", git: "katya_repo", date_of_birth: "22.11.2004")
dmitry = Student.new(surname:"Зайцев", name:"Дмитрий", patronymic:"Андреевич", id: 3, phone_num: "89881234567", telegram: "@DimaN", date_of_birth: "03.04.2005")
anna = Student.new(surname:"Крылова", name:"Анна", patronymic:"Викторовна", phone_num: "89033445566")

anya = StudentShort.from_student(anna)
vlad = StudentShort.from_string(id: 10, string: "Белоусов В.А., https://github.com/vlad_bel, +79876543210")
nikolay = StudentShort.from_string(id: 20, string: "Зеленый Н.Н.")

puts "\nПроверка Students_list_YAML"
yaml_strategy = StudentsListYAML.new
students_list_yaml = StudentsList.new('../Data/students.yaml', yaml_strategy)
students_list_yaml.add_student(alex)
students_list_yaml.add_student(kate)
students_list_yaml.add_student(dmitry)
students_list_yaml.write
students_list_yaml.read

data_list = students_list_yaml.get_k_n_student_short_list(1, students_list_yaml.get_student_short_count)
data = data_list.get_data

(0..data.row_count - 1).each do |index|
    puts "#{data.get_element(index, 0)}, #{data.get_element(index, 1)}, #{data.get_element(index, 2)}, #{data.get_element(index, 3)}"   
end