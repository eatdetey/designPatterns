class DataList

    def initialize(data)
        self.data = data
    end

    private

    attr_reader :data

    def data=(data)
        unless data.is_a?(Array)
            raise ArgumentError, 'Data must be an array'
        end

        @data = data
    end
end