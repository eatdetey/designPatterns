class StudentsListInterface
    def get_student_by_id(id)
        raise NotImplementedError, 'Method not implemented in this class'
    end

    def get_k_n_student_short_list(k, n, data_list = nil)
        raise NotImplementedError, 'Method not implemented in this class'
    end

    def add_student(student)
        raise NotImplementedError, 'Method not implemented in this class'
    end

    def replace_student(id, new_student)
        raise NotImplementedError, 'Method not implemented in this class'
    end

    def delete_student(id)
        raise NotImplementedError, 'Method not implemented in this class'
    end

    def get_student_short_count(filter = nil)
        raise NotImplementedError, 'Method not implemented in this class'
    end
end