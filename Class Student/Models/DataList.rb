class Data_List

    def initialize(data)
        self.data = data
        self.selected = []
    end

    # Выбор элемента по номеру
    def select(number)
        unless number.is_a?(Integer) && number >= 0 && number < data.size
            raise ArgumentError, 'The parameter must be a number within the array size'
        end
        self.selected << number unless self.selected.include?(number)
    end

    # Получение ID выбранных элементов
    def get_selected
        self.selected
    end

    def get_names
        raise NotImplementedError, 'Method not implemented in this class'
    end

    def get_data
        raise NotImplementedError, 'Method not implemented in this class'
    end

    private

    attr_reader :data
    attr_accessor :selected

    def data=(data)
        unless data.is_a?(Array)
            raise ArgumentError, 'Data must be an array'
        end

        @data = data
    end
end