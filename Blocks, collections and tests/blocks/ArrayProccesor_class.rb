class ArrayProcessor
  attr_reader :array

  def initialize(array)
    @array = array.dup.freeze
  end

  def drop_while
    result = []
    dropping = true

    for element in @array
      if dropping && yield(element)
        next
      else
        dropping = false
        result << element
      end
    end

    result
  end
 

  def max
    max_value = @array.first
    for element in @array[1..-1]
      max_value = element if element > max_value
    end
    max_value
  end
 
  end