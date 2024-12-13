require 'yaml'
require_relative './StudentsListStrategy.rb'

class StudentsListYAML < StudentsListStrategy
    def read(file_path)
        content = File.read(file_path)
        student_hashes = YAML.safe_load(content, symbolize_names: true, permitted_classes: [Symbol])

        students = student_hashes.map do |student_hash|
            Student.new(**student_hash)
        end
    end    

    def write(file_path, students)
        content = students.map { |student| student.to_h }
        File.write(file_path, content.to_yaml)
    end

    def empty_content
        [].to_yaml
    end
end