require 'pg'

class ConnectionDB
    private_class_method :new

    def self.instance(db_config = nil)
        @instance ||= new(db_config)
    end

    def query(query, params=[])
        self.connection.exec_params(query, params)
    end

    def close
        self.connection.close
        self.connection.nil
        @instance = nil
    end

    private
    attr_accessor :connection

    # Переменная единственного экземпляра
    @instance = nil

    def initialize(db_config)
        raise "No DB configuration" unless db_config
        self.connection = PG.connect(db_config)
    end
end