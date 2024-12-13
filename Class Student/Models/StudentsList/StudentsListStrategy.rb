class StudentsListStrategy
    def read(file_path)
        raise NotImplementedError, 'Method not implemented in this class'
    end
  
    def write(file_path, students)
        raise NotImplementedError, 'Method not implemented in this class'
    end

    def empty_content
        raise NotImplementedError, 'Method not implemented in this class'
    end
  end