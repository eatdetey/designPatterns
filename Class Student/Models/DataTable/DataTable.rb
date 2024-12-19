class DataTable

    def initialize(data)
        self.data = data
    end

    def get_element(row_index, column_index)
        self.data[row_index][column_index]
    end

    def row_count
        self.data.size
    end

    def column_count
        self.data.empty? ? 0 : self.data[0].size
    end

    private

    attr_reader :data
    
    def data=(data)
        unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
            raise ArgumentError, 'Data must be a two-dimensional array'
        end

        @data = data
    end
end