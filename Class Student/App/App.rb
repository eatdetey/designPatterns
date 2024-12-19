require 'fox16'
require_relative "./StudentListView.rb"
include Fox

app = FXApp.new
file_adapter = StudentsListFile.new('../Data/students.json', StudentsListJSON.new)
students_list = StudentsList.new(file_adapter)
StudentListView.new(app, file_adapter)
app.create
app.run