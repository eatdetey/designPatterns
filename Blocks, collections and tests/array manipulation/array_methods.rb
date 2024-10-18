def menu
	puts "\nСписок задач, доступных к решению:"
	puts "Задача 1 - Циклический сдвиг элементов массива вправо на две позиции;"
	puts "Задача 2 - Циклический сдвиг элементов массива вправо на одну позицию;"
	puts "Задача 3 - Поиск количества чётных элементов;"
	puts "Задача 4 - Поиск количества минимальных элементов;"
	puts "Задача 5 - Построение списка, упорядоченного по количеству вхождений элементов, на основе данного."
	print "\nВведите номер задачи, которую необходимо решить, или -1, чтобы выйти из программы: "
end

def read_array_from_file(filename)
  File.read(filename).split.map(&:to_i)
end

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


loop do
	puts "\n----------------------------------------\n"

	arr = read_array_from_file('array_example.txt')
	
	menu
	task_number = gets.chomp.to_i
	
	if task_number == -1 then break end
	
	puts "Массив: #{arr}"
	case task_number
	when 1
		puts "Результат обработки: #{shift_right(arr, 2)}"
	when 2
		puts "Результат обработки: #{shift_right(arr, 1)}"
	when 3
		puts "Результат обработки: #{count_even_elements(arr)}"
	when 4
		puts "Результат обработки: #{count_min_elements(arr)}"
	when 5
		puts "Результат обработки: #{sort_by_frequency(arr)}"
	else
		puts "Задачи с таким номером не существует :("
	end
end