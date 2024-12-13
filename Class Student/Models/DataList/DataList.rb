class DataList

    def initialize(data)
        self.data = data
        self.selected = []
    end

    def select(number)
        unless number.is_a?(Integer) && number >= 0 && number < data.size
            raise ArgumentError, 'The parameter must be a number within the array size'
        end
        self.selected << number unless self.selected.include?(number)
    end

    def get_selected
        self.selected
    end

    def get_names
        column_names = ['№'] # Нулевой столбец - порядковый номер
        base_names.each do |name| 
            column_names << name
        end
        column_names
    end

    # Получение объекта класса Data_Table
    def get_data
        data_table = [get_names]
        data.each_with_index do |item, index|
            data_table << build_row(item, index)
        end
        DataTable.new(data_table)
    end

    def data=(data)
        unless data.is_a?(Array)
            raise ArgumentError, 'Data must be an array'
        end

        @data = data
    end

    private

    def base_names
        raise NotImplementedError, 'Method not implemented in this class'
    end    

    def build_row(item, index)
        raise NotImplementedError, 'Method not implemented in this class'
    end    

    private

    attr_reader :data
    attr_accessor :selected

end