def shift_right(arr, i)
  arr.rotate(-i)
end

arr = [1, 2, 3, 4, 5]
puts "Массив: #{arr}"
puts "Задача 1 - #{shift_right(arr, 2)}"
puts "Задача 2 - #{shift_right(arr, 1)}"