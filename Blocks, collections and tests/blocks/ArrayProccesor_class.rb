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
 
  end