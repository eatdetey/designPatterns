def minElement(array)
	if array.length > 0 
		min = array[0]
	else 
		puts "Array is empty"
	end
	
	for element in array
		if element < min then
			min = element
		end
	end
	
	return min
end

def firstPositiveElement(array)
	if array.length > 0 
		fPos = -1
	else 
		puts "Array is empty"
	end
	
	for element in array
		if element > 0 then
			fPos = element
			break
		end
	end
	
	return fPos
end

def doSelectedMethod(method, path)
	array = File.read(path).split 
	
	for i in 0..array.length do
		array[i] = array[i].to_i
	end
	
	case method
	when 1
	 output = minElement(array)
	when 2
	 output = firstPositiveElement(array)
	else
		puts "Choose method 1 or 2!"
	end
	
	return output
end

puts(doSelectedMethod(ARGV[0].to_i,ARGV[1]))