def shift_right(arr, i)
  arr.rotate(-i)
end

def count_even_elements(arr)
  arr.count { |x| x.even? }
end

def count_min_elements(arr)
  min = arr.min
  arr.count(min)
end

def sort_by_frequency(arr)
  grouped = arr.group_by { |x| x }
  sorted_groups = grouped.sort_by { |_, group| -group.size }
  sorted_array = sorted_groups.flat_map { |_, group| group }
  return sorted_array
end

arr = [-1, -1, -1, 2, 3, 4, 5]
puts "Массив: #{arr}"
puts "Задача 1 - #{shift_right(arr, 2)}"
puts "Задача 2 - #{shift_right(arr, 1)}"
puts "Задача 3 - #{count_even_elements(arr)}"
puts "Задача 4 - #{count_min_elements(arr)}"
puts "Задача 5 - #{sort_by_frequency(arr)}"