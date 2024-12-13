require "./Student.rb"
require "./StudentShort.rb"
require "./BinaryTree.rb"

require "./Models/DataListStudentShort.rb"

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

(0..3).each do |index|
    puts "#{index}: #{table.get_element(index, 1)}, #{table.get_element(index, 2)}, #{table.get_element(index, 3)}"   
end