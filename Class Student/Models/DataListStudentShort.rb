require "./Models/DataList.rb"
require "./Models/DataTable.rb"
require "./StudentShort.rb"

class DataListStudentShort < DataList

    def base_names
        ["name", "git", "contact"]
    end

    def build_row(student_short, index)
        [
            index + 1,                  
            student_short.initials,     
            student_short.git,           
            student_short.contacts       
        ]
    end
end