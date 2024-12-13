require "./Models/DataList.rb"
require "./Models/DataTable.rb"
require "./StudentShort.rb"

class DataListStudentShort < DataList

    def get_names
        %w[№ name git contact]
    end

    # Получение объекта класса Data_Table
    def get_data
        data_table = [self.get_names]

        data.each_with_index.map do |student_short, index|
            data_table <<
            [
                index + 1,
                student_short.initials,
                student_short.git,
                student_short.contact
            ]
        end

        DataTable.new(data_table)
    end
end