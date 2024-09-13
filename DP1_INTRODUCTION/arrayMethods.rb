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