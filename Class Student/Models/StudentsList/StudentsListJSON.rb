require 'json'
require_relative './StudentsListStrategy.rb'

class StudentsListJSON < StudentsListStrategy
    def read(file_path)
        content = File.read(file_path)
        student_hashes = JSON.parse(content, symbolize_names: true)

        students = student_hashes.map do |student_hash|
            Student.new(**student_hash)
        end
    end

    def write(file_path, students)
        content = students.map { |student| student.to_h }
        File.write(file_path, JSON.pretty_generate(content))
    end

    def empty_content
        [].to_json
    end
end