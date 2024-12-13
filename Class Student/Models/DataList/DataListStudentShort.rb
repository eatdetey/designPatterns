require_relative "./DataList.rb"
require_relative "../DataTable/DataTable.rb"
require_relative "../StudentShort/StudentShort.rb"

class DataListStudentShort < DataList
    
    private

    def base_names
        ["name", "git", "contact"]
    end

    def build_row(student_short, index)
        [
            index + 1,                  
            student_short.initials,     
            student_short.git,           
            student_short.contact       
        ]
    end
end