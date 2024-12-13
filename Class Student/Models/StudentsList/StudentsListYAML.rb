require 'yaml'
require_relative '../Student/Student.rb'
require_relative '../StudentShort/StudentShort.rb'
require_relative '../DataList/DataListStudentShort.rb'

class Students_list_YAML

    def initialize(file_path)
        self.file_path = file_path
        self.students = []
        # Если файла не существует, создаётся пустой YAML
        unless File.exist?(file_path)
            File.write(file_path, [].to_yaml)
        end
    end    

    # Чтение из файла
    def read
        content = File.read(file_path)
        student_hashes = YAML.safe_load(content, symbolize_names: true, permitted_classes: [Date, Symbol])

        self.students = student_hashes.map do |student_hash|
            Student.new(**student_hash)
        end
    end    

    # Запись в файл
    def write
        content = students.map{|student| student.to_h}
        File.write(file_path, content.to_yaml)
    end    

    # Получение студента по ID
    def get_student_by_id(id)
        student = students.find { |student| student.id == id }
        raise "No student with such ID: #{id}" if student.nil?
        student
    end

    # Получение списка k по счету n объектов Student_short в форме Data_list
    def get_k_n_student_short_list(k, n, data_list = nil)
        raise ArgumentError, 'k and n must be positive' unless k.is_a?(Integer) && n.is_a?(Integer) && k > 0 && n > 0
        
        start = (k - 1) * n

        # Извлекаем нужный диапазон студентов
        selected_students = students[start, n] || []

        # Преобразуем в список Student_short
        student_short_list = selected_students.map { |student| StudentShort.from_student(student) }

        data_list ||= DataListStudentShort.new(student_short_list)

        data_list
    end

    # Сортировка по ФИО
    def sort_by_initials
        students.sort_by!{|student| student.initials}
    end

    # Добавление нового студента
    def add_student(student)
        new_id = students.empty? ? 1 : students.max_by(&:id).id + 1 
        student.id = new_id
        self.students << student
    end

    # Замена студента по ID
    def replace_student_by_id(id, new_student)
        student_index = students.index { |student| student.id == id }
        if student_index.nil?
            raise "No student with such ID: #{id}"
        end
        # Замена студента
        students[student_index] = new_student
        new_student.id = id
    end

    # Удаление студента по ID
    def delete_student_by_id(id)
        student_index = students.index { |student| student.id == id }
        if student_index.nil?
            raise "No student with such ID: #{id}"
        end
        # Удаление студента
        students.delete_at(student_index)
    end

    def get_student_short_count
        students.size
    end 

    private

    attr_accessor :file_path, :students
end