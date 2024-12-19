require 'fox16'
require_relative "./StudentListView.rb"
require_relative '../Models/StudentsList/StudentsList.rb'
include Fox

app = FXApp.new
file_processor = StudentsListFile.new('../Data/students.json', StudentsListJSON.new)
adapter = StudentsListFileAdapter.new(file_processor)
students_list = StudentsList.new(adapter)
StudentListView.new(app, students_list)
app.create
app.run