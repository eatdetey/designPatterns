require 'minitest/autorun'
require_relative 'ArrayProcessor_class'

class TestArrayProcessor < Minitest::Test
  def setup
    @array = [0, -10, 5, 3.5, 100, -2.5, 50, 1, 2, -50]
    @processor = ArrayProcessor.new(@array)
  end

  def test_array_immutable
    assert_raises(FrozenError) { @processor.array << 6 }
  end

  def test_map
    result = @processor.map { |el| el * 2 }
    assert_equal([0, -20, 10, 7.0, 200, -5.0, 100, 2, 4, -100], result)
  end

  def test_select
    result = @processor.select { |el| el > 0 }
    assert_equal([5, 3.5, 100, 50, 1, 2], result)
  end

  def test_drop_while
    result = @processor.drop_while { |el| el < 10 }
    assert_equal([100, -2.5, 50, 1, 2, -50], result)
  end

  def test_max
    assert_equal(100, @processor.max)
  end

  def test_sort
    sorted_result = @processor.sort
    assert_equal([-50, -10, -2.5, 0, 1, 2, 3.5, 5, 50, 100], sorted_result)
  end

  def test_detect
    result = @processor.detect { |el| el < 0 }
    assert_equal(-10, result)
  end
end
