require 'pg'
require_relative '../Student/Student.rb'
require_relative '../StudentShort/StudentShort.rb'
require_relative '../DataList/DataListStudentShort.rb'
require_relative '../Database/ConnectionDB.rb'

class StudentsListDB
    def initialize(db_config)
        self.connection = DB_connection.instance(db_config)
    end

    # Получение студента по ID
    def get_student_by_id(id)
        result = connection.query("SELECT * FROM student WHERE id = $1", [id])
        if result.ntuples == 0
            raise "No student with such ID: #{id}"
        end

        student_data = result[0]
        Student.new(
            surname: student_data['surname'],
            name: student_data['name'],
            patronymic: student_data['patronymic'],
            id: student_data['id'].to_i,
            git: student_data['git'],
            email: student_data['email'],
            telegram: student_data['telegram'],
            phone_num: student_data['phone_num'],
            date_of_birth: student_data['date_of_birth']
        )
    end

    # Получение списка k по счету n объектов Student_short в форме Data_list
    def get_k_n_student_short_list(k, n, data_list = nil)
        raise ArgumentError, 'k and n must be positive' unless k > 0 && n > 0

        offset = (k - 1) * n
        result = connection.query("SELECT * FROM student LIMIT $1 OFFSET $2", [n, offset])

        student_short_list = result.map do |student_data|
        student = Student.new(
            surname: student_data['surname'],
            name: student_data['name'],
            patronymic: student_data['patronymic'],
            id: student_data['id'].to_i,
            git: student_data['git'],
            email: student_data['email'],
            telegram: student_data['telegram'],
            phone_num: student_data['phone_num'],
            date_of_birth: student_data['date_of_birth']
        )
        StudentShort.from_student(student)
        end

        data_list ||= DataListStudentShort.new(student_short_list)
        data_list
    end

    # Добавление нового студента
    def add_student(student)
        # Генерация нового ID автоматически через SERIAL
        result = connection.query(
        "INSERT INTO student (surname, name, patronymic, git, email, telegram, phone_num, date_of_birth) 
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id",
        [
            student.surname, student.name, student.patronymic, student.git, student.email,
            student.telegram, student.phone_num, student.date_of_birth
        ]
        )
        student.id = result[0]['id'].to_i
    end

    # Замена студента по ID
    def replace_student_by_id(id, new_student)
        result = connection.query(
        "UPDATE student SET surname = $1, name = $2, patronymic = $3, git = $4, email = $5, 
        telegram = $6, phone_num = $7, date_of_birth = $8 WHERE id = $9",
        [
            new_student.surname, new_student.name, new_student.patronymic, new_student.git, 
            new_student.email, new_student.telegram, new_student.phone_num, new_student.date_of_birth, id
        ]
        )
        raise "No student with such ID: #{id}" if result.cmd_tuples == 0
    end

    # Удаление студента по ID
    def delete_student_by_id(id)
        result = connection.query("DELETE FROM student WHERE id = $1", [id])
        raise "No student with such ID: #{id}" if result.cmd_tuples == 0
    end

    # Количество студентов
    def get_student_short_count
        result = connection.query("SELECT COUNT(*) FROM student")
        result[0]['count'].to_i
    end

    # Закрытие соединения с базой данных
    def close
        connection.close
    end

    private
    attr_accessor :connection
end