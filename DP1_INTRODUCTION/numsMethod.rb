#Task 4 (v7) 

#Method 1 (Метод 1 Найти сумму простых делителей числа.)
def isPrime(num)
	if num <=1 then #1 is not a prime number here
		return false
	end
	for i in 2..num/2 do
		if num % i == 0 then
			return false
		end
	end
	return true
end

def dividersSum(num)
	sum = 0
	if num == 1 then 
		return 0
	else
		if isPrime(num) then
			return num
		else
			for i in 2..num/2 do
				if num % i ==0 and isPrime(i)
					sum += i 
				end
			end
		end
	end
	return sum
end

puts(dividersSum(ARGV[0].to_i))