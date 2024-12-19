require 'fox16'
require_relative "./View/StudentListView.rb"
include Fox

app = FXApp.new
StudentListView.new(app)
app.create
app.run